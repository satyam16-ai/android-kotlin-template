#!/bin/bash

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Detect OS
OS="$(uname -s)"
case "${OS}" in
    Linux*)     MACHINE=Linux;;
    Darwin*)    MACHINE=Mac;;
    *)          MACHINE="UNKNOWN:${OS}"
esac

echo -e "${BLUE}════════════════════════════════════${NC}"
echo -e "${BLUE}  Android Kotlin Auto Setup${NC}"
echo -e "${BLUE}════════════════════════════════════${NC}"
echo -e "${YELLOW}Working directory: $SCRIPT_DIR${NC}"
echo -e "${YELLOW}Operating System: $MACHINE${NC}"
echo ""

# Function to print status
print_status() {
    echo -e "${GREEN}✓${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

print_info() {
    echo -e "${YELLOW}→${NC} $1"
}

# 1. Check/Install Java
print_info "Checking Java installation..."
if ! command -v java &> /dev/null; then
    print_info "Installing Java 17..."
    if [ "$MACHINE" = "Mac" ]; then
        brew install openjdk@17
        export JAVA_HOME=$(/usr/libexec/java_home -v 17)
    else
        sudo apt update -qq
        sudo apt install -y openjdk-17-jdk
        export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
    fi
    print_status "Java installed"
else
    print_status "Java already installed: $(java -version 2>&1 | head -n 1)"
fi

# 1.5. Check/Install Kotlin (Optional but recommended)
print_info "Checking Kotlin installation..."
if ! command -v kotlinc &> /dev/null; then
    print_info "Installing Kotlin compiler..."
    if [ "$MACHINE" = "Mac" ]; then
        brew install kotlin
    else
        # Kotlin installation via SDKMAN or direct download
        if command -v sdk &> /dev/null; then
            sdk install kotlin
        else
            print_info "Kotlin compiler not critical for building. Skipping..."
            echo -e "   ${YELLOW}Note: Gradle will use its own Kotlin plugin${NC}"
        fi
    fi
    if command -v kotlinc &> /dev/null; then
        print_status "Kotlin installed: $(kotlinc -version 2>&1 | head -n 1)"
    fi
else
    print_status "Kotlin already installed: $(kotlinc -version 2>&1 | head -n 1)"
fi

# 2. Check/Install Android SDK
if [ "$MACHINE" = "Mac" ]; then
    ANDROID_SDK="$HOME/Library/Android/sdk"
else
    ANDROID_SDK="$HOME/Android/Sdk"
fi

print_info "Checking Android SDK..."

if [ ! -d "$ANDROID_SDK" ]; then
    print_info "Installing Android SDK..."
    mkdir -p "$ANDROID_SDK/cmdline-tools"
    cd "$ANDROID_SDK/cmdline-tools"
    
    # Download appropriate SDK tools for OS
    if [ "$MACHINE" = "Mac" ]; then
        wget -q --show-progress https://dl.google.com/android/repository/commandlinetools-mac-11076708_latest.zip
        unzip -q commandlinetools-mac-11076708_latest.zip
        rm commandlinetools-mac-11076708_latest.zip
    else
        wget -q --show-progress https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip
        unzip -q commandlinetools-linux-11076708_latest.zip
        rm commandlinetools-linux-11076708_latest.zip
    fi
    
    mv cmdline-tools latest
    
    export ANDROID_HOME="$ANDROID_SDK"
    export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$PATH"
    
    # Accept licenses and install SDK components
    yes | sdkmanager --licenses > /dev/null 2>&1
    
    if sdkmanager "platform-tools" "platforms;android-34" "build-tools;34.0.0" > /dev/null 2>&1; then
        print_status "Android SDK installed"
    else
        print_error "SDK Manager failed. Please install Android SDK manually."
        echo -e "   ${YELLOW}Download from: https://developer.android.com/studio${NC}"
        exit 1
    fi
else
    print_status "Android SDK already installed"
    export ANDROID_HOME="$ANDROID_SDK"
    export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$PATH"
fi

# Return to script directory
cd "$SCRIPT_DIR"

# 3. Create local.properties
echo "sdk.dir=$ANDROID_SDK" > local.properties
print_status "SDK configuration created"

# 4. Install ADB if not present
print_info "Checking ADB..."
if ! command -v adb &> /dev/null; then
    print_info "Installing ADB..."
    if [ "$MACHINE" = "Mac" ]; then
        brew install android-platform-tools
    else
        sudo apt install -y android-tools-adb android-tools-fastboot
    fi
    print_status "ADB installed"
else
    print_status "ADB already installed"
fi

# 4.5. Check Gradle Wrapper
print_info "Checking Gradle wrapper..."
if [ ! -f "./gradlew" ]; then
    print_info "Gradle wrapper not found, downloading and creating..."
    
    # Create temp directory
    GRADLE_TMP=$(mktemp -d)
    cd "$GRADLE_TMP"
    
    # Download Gradle
    print_info "Downloading Gradle 8.12..."
    wget -q https://services.gradle.org/distributions/gradle-8.12-bin.zip
    unzip -q gradle-8.12-bin.zip
    
    # Go back to project
    cd - > /dev/null
    
    # Create wrapper
    "$GRADLE_TMP/gradle-8.12/bin/gradle" wrapper --gradle-version 8.12
    chmod +x gradlew
    
    # Cleanup
    rm -rf "$GRADLE_TMP"
    
    print_status "Gradle wrapper created"
else
    print_status "Gradle wrapper found"
    chmod +x gradlew
fi

# 5. Build the project
echo ""
print_info "Building Android app..."
./gradlew clean assembleDebug 2>&1 | tee build.log | grep -E "BUILD|FAILURE|error" || true

if [ ${PIPESTATUS[0]} -eq 0 ]; then
    print_status "App built successfully!"
    APK_SIZE=$(du -h app/build/outputs/apk/debug/app-debug.apk | cut -f1)
    echo -e "   ${GREEN}APK Size: $APK_SIZE${NC}"
    echo -e "   ${GREEN}Location: app/build/outputs/apk/debug/app-debug.apk${NC}"
    echo -e "   ${YELLOW}Build log saved to: build.log${NC}"
else
    print_error "Build failed. Check build.log for details"
    echo -e "   ${YELLOW}Log file: $SCRIPT_DIR/build.log${NC}"
    exit 1
fi

# 6. Check for device and install
echo ""
print_info "Device Detection & Selection..."

# Function to list and select emulators
list_emulators() {
    if command -v emulator &> /dev/null; then
        EMULATORS=$("$ANDROID_HOME/emulator/emulator" -list-avds 2>/dev/null)
        if [ ! -z "$EMULATORS" ]; then
            echo -e "${GREEN}Available Emulators:${NC}"
            echo "$EMULATORS" | nl
            return 0
        fi
    fi
    return 1
}

# Check for physical devices
PHYSICAL_DEVICES=$(adb devices | grep -w "device$" | wc -l)

# Check for emulators
EMULATOR_COUNT=0
EMULATOR_INSTALLED=false

# Check if emulator binary exists
if command -v emulator &> /dev/null; then
    EMULATOR_INSTALLED=true
    EMULATOR_COUNT=$(emulator -list-avds 2>/dev/null | wc -l)
elif [ -f "$ANDROID_HOME/emulator/emulator" ]; then
    EMULATOR_INSTALLED=true
    EMULATOR_COUNT=$("$ANDROID_HOME/emulator/emulator" -list-avds 2>/dev/null | wc -l)
fi

echo ""
echo -e "${BLUE}════════════════════════════════════${NC}"
echo -e "${BLUE}  Device Selection${NC}"
echo -e "${BLUE}════════════════════════════════════${NC}"
echo ""
echo -e "${GREEN}Physical Devices Connected: $PHYSICAL_DEVICES${NC}"
echo -e "${GREEN}Emulators Available: $EMULATOR_COUNT${NC}"

if [ "$EMULATOR_INSTALLED" = false ]; then
    echo -e "${YELLOW}Emulator tool: Not installed${NC}"
fi
echo ""

if [ $PHYSICAL_DEVICES -eq 0 ] && [ $EMULATOR_COUNT -eq 0 ]; then
    echo -e "${YELLOW}No devices or emulators found!${NC}"
    echo ""
    echo "Options:"
    echo "  1) Create a new Android Emulator (requires Android Studio)"
    echo "  2) Connect a physical device"
    echo "  3) Skip installation (APK already built)"
    echo ""
    read -p "Select option (1-3): " choice
    
    case $choice in
        1)
            print_info "Opening Android Studio AVD Manager..."
            if command -v studio &> /dev/null; then
                studio &
                echo -e "${YELLOW}Please create an emulator in AVD Manager, then run:${NC}"
                echo "   ./gradlew installDebug"
            else
                echo -e "${RED}Android Studio not found!${NC}"
                echo ""
                echo -e "${YELLOW}To create an emulator:${NC}"
                echo "   1. Install Android Studio from: https://developer.android.com/studio"
                echo "   2. Open Android Studio → Tools → Device Manager"
                echo "   3. Create a new Virtual Device"
                echo "   4. Run: ./gradlew installDebug"
            fi
            ;;
        2)
            echo ""
            echo -e "${YELLOW}To connect a physical device:${NC}"
            echo "   1. Connect phone via USB"
            echo "   2. Enable USB Debugging (Settings → Developer Options)"
            echo "   3. Enable 'Install via USB' (for Xiaomi/Redmi)"
            echo "   4. Run: adb devices"
            echo "   5. Run: ./gradlew installDebug"
            ;;
        3)
            echo -e "${BLUE}APK built at: app/build/outputs/apk/debug/app-debug.apk${NC}"
            ;;
    esac
    exit 0
fi

# If devices are available, show selection menu
if [ $PHYSICAL_DEVICES -gt 0 ] || [ $EMULATOR_COUNT -gt 0 ]; then
    echo "Where do you want to install the app?"
    echo ""
    
    MENU_OPTIONS=()
    MENU_COUNT=1
    
    # Add physical device option
    if [ $PHYSICAL_DEVICES -gt 0 ]; then
        echo "  $MENU_COUNT) Physical Device"
        MENU_OPTIONS[$MENU_COUNT]="physical"
        MENU_COUNT=$((MENU_COUNT + 1))
    fi
    
    # Always add emulator option (create if none exist)
    if [ $EMULATOR_COUNT -gt 0 ]; then
        echo "  $MENU_COUNT) Android Emulator (Select existing)"
        MENU_OPTIONS[$MENU_COUNT]="emulator"
    else
        echo "  $MENU_COUNT) Android Emulator (Create new)"
        MENU_OPTIONS[$MENU_COUNT]="create_emulator"
    fi
    MENU_COUNT=$((MENU_COUNT + 1))
    
    echo "  $MENU_COUNT) Skip installation"
    MENU_OPTIONS[$MENU_COUNT]="skip"
    
    echo ""
    read -p "Select option (1-$MENU_COUNT): " device_choice
    
    case ${MENU_OPTIONS[$device_choice]} in
        physical)
            print_info "Installing on Physical Device..."
            
            # List all physical devices
            echo ""
            echo -e "${GREEN}Connected Devices:${NC}"
            adb devices | grep -w "device$" | nl
            
            DEVICE_COUNT=$(adb devices | grep -w "device$" | wc -l)
            
            if [ $DEVICE_COUNT -gt 1 ]; then
                echo ""
                read -p "Select device number (1-$DEVICE_COUNT): " dev_num
                SELECTED_DEVICE=$(adb devices | grep -w "device$" | sed -n "${dev_num}p" | awk '{print $1}')
            else
                SELECTED_DEVICE=$(adb devices | grep -w "device" | awk '{print $1}')
            fi
            
            print_status "Installing on device: $SELECTED_DEVICE"
            adb -s "$SELECTED_DEVICE" install -r app/build/outputs/apk/debug/app-debug.apk
            
            if [ $? -eq 0 ]; then
                print_status "App installed successfully!"
                echo ""
                echo -e "${GREEN}════════════════════════════════${NC}"
                echo -e "${GREEN}     🎉 SETUP COMPLETE! 🎉${NC}"
                echo -e "${GREEN}════════════════════════════════${NC}"
                echo ""
                echo -e "${BLUE}Launch 'MyApplication' from your phone!${NC}"
                
                # Auto-launch app
                read -p "Launch app now? (Y/n): " launch
                if [[ ! $launch =~ ^[Nn]$ ]]; then
                    adb -s "$SELECTED_DEVICE" shell am start -n com.example.myapplication/.SplashActivity
                    print_status "App launched!"
                fi
            else
                print_error "Installation failed!"
            fi
            ;;
            
        emulator)
            print_info "Using Android Emulator..."
            
            # List available emulators
            echo ""
            echo -e "${GREEN}Available Emulators:${NC}"
            "$ANDROID_HOME/emulator/emulator" -list-avds | nl
            
            AVD_COUNT=$("$ANDROID_HOME/emulator/emulator" -list-avds | wc -l)
            
            echo ""
            read -p "Select emulator number (1-$AVD_COUNT) or 'n' to create new: " emu_choice
            
            if [[ $emu_choice =~ ^[Nn]$ ]]; then
                print_info "Creating new emulator..."
                
                # Check if system images are available
                print_info "Checking for system images..."
                
                # Download system image if needed
                if ! sdkmanager --list | grep -q "system-images;android-34"; then
                    print_info "Downloading Android 34 system image..."
                    yes | sdkmanager "system-images;android-34;google_apis;x86_64"
                fi
                
                # Create AVD
                read -p "Enter emulator name (default: TestDevice): " emu_name
                emu_name=${emu_name:-TestDevice}
                
                echo no | avdmanager create avd -n "$emu_name" \
                    -k "system-images;android-34;google_apis;x86_64" \
                    --device "pixel_5"
                
                if [ $? -eq 0 ]; then
                    print_status "Emulator '$emu_name' created successfully!"
                    SELECTED_EMU="$emu_name"
                else
                    print_error "Failed to create emulator"
                    exit 1
                fi
            else
                SELECTED_EMU=$("$ANDROID_HOME/emulator/emulator" -list-avds | sed -n "${emu_choice}p")
            fi
            
            # Check if emulator is already running
            if adb devices | grep -q "emulator"; then
                print_status "Emulator already running"
            else
                print_info "Starting emulator: $SELECTED_EMU"
                echo -e "${YELLOW}This may take a few minutes...${NC}"
                
                # Start emulator in background
                "$ANDROID_HOME/emulator/emulator" -avd "$SELECTED_EMU" -no-snapshot-load &
                EMULATOR_PID=$!
                
                # Wait for emulator to boot
                print_info "Waiting for emulator to boot..."
                adb wait-for-device
                
                # Wait for boot to complete
                while [ "$(adb shell getprop sys.boot_completed 2>/dev/null | tr -d '\r')" != "1" ]; do
                    sleep 2
                    echo -n "."
                done
                echo ""
                print_status "Emulator booted successfully!"
            fi
            
            # Install app on emulator
            print_info "Installing app on emulator..."
            sleep 2
            ./gradlew installDebug --quiet
            
            if [ $? -eq 0 ]; then
                print_status "App installed on emulator!"
                echo ""
                echo -e "${GREEN}════════════════════════════════${NC}"
                echo -e "${GREEN}     🎉 SETUP COMPLETE! 🎉${NC}"
                echo -e "${GREEN}════════════════════════════════${NC}"
                
                # Auto-launch app
                sleep 1
                adb shell am start -n com.example.myapplication/.SplashActivity
                print_status "App launched on emulator!"
            else
                print_error "Installation failed"
            fi
            ;;
            
        create_emulator)
            print_info "Creating new Android Emulator..."
            echo ""
            
            # Check if emulator command exists
            if ! command -v emulator &> /dev/null && [ ! -f "$ANDROID_HOME/emulator/emulator" ]; then
                echo -e "${YELLOW}╔════════════════════════════════════════════════════════╗${NC}"
                echo -e "${YELLOW}║  📦 Installing Emulator Tool                          ║${NC}"
                echo -e "${YELLOW}╚════════════════════════════════════════════════════════╝${NC}"
                echo ""
                
                # Ensure cmdline-tools are properly installed
                if [ ! -d "$ANDROID_HOME/cmdline-tools/latest" ]; then
                    print_info "Installing command line tools first..."
                    echo -e "${BLUE}Source: https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip${NC}"
                    
                    mkdir -p "$ANDROID_HOME/cmdline-tools"
                    cd "$ANDROID_HOME/cmdline-tools"
                    
                    wget -q --show-progress https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip
                    unzip -q commandlinetools-linux-11076708_latest.zip
                    rm commandlinetools-linux-11076708_latest.zip
                    mv cmdline-tools latest
                    
                    cd "$SCRIPT_DIR"
                    export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$PATH"
                    
                    print_status "Command line tools installed"
                    echo ""
                fi
                
                print_info "Installing Android Emulator..."
                echo -e "${BLUE}Package: emulator${NC}"
                echo -e "${BLUE}Source: Google Android Repository${NC}"
                echo -e "${YELLOW}Size: ~100-150 MB | Time: 1-2 minutes${NC}"
                echo ""
                
                # Use --install flag for proper installation
                print_info "Downloading and installing (this will take 1-2 minutes)..."
                echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
                
                # Run in background with verbose output
                yes | sdkmanager --verbose --install "emulator" > /tmp/emulator-install.log 2>&1 &
                INSTALL_PID=$!
                
                # Show animated progress with download status
                SPINNER=("⠋" "⠙" "⠹" "⠸" "⠼" "⠴" "⠦" "⠧" "⠇" "⠏")
                ELAPSED=0
                LAST_STATUS=""
                
                while kill -0 $INSTALL_PID 2>/dev/null; do
                    # Check log file for download progress
                    if [ -f /tmp/emulator-install.log ]; then
                        # Try multiple patterns to extract download progress
                        # Pattern 1: "50 MB / 150 MB" or "50.5 MB / 150.0 MB"
                        DOWNLOAD_INFO=$(tail -30 /tmp/emulator-install.log 2>/dev/null | grep -a -oE "[0-9]+(\.[0-9]+)?\s*[KMG]?B\s*/\s*[0-9]+(\.[0-9]+)?\s*[KMG]?B" 2>/dev/null | tail -1)
                        
                        # Pattern 2: Percentage like "50%" or "[=====     ] 50%"
                        if [ -z "$DOWNLOAD_INFO" ]; then
                            DOWNLOAD_INFO=$(tail -10 /tmp/emulator-install.log 2>/dev/null | grep -a -oE "[0-9]+%" 2>/dev/null | tail -1)
                        fi
                        
                        if [ ! -z "$DOWNLOAD_INFO" ]; then
                            LAST_STATUS="$DOWNLOAD_INFO"
                        else
                            # Check for status messages
                            STATUS_LINE=$(tail -10 /tmp/emulator-install.log 2>/dev/null | grep -a -iE "download|install|fetch|prepar" 2>/dev/null | tail -1 | cut -c1-40)
                            if [ ! -z "$STATUS_LINE" ]; then
                                LAST_STATUS="$STATUS_LINE"
                            fi
                        fi
                    fi
                    
                    for SPIN in "${SPINNER[@]}"; do
                        if ! kill -0 $INSTALL_PID 2>/dev/null; then
                            break
                        fi
                        echo -ne "\r   ${YELLOW}${SPIN} Downloading emulator... ${ELAPSED}s ${LAST_STATUS}${NC}                    "
                        sleep 1
                        ELAPSED=$((ELAPSED + 1))
                    done
                done
                
                # Wait for completion
                wait $INSTALL_PID
                INSTALL_STATUS=$?
                
                echo -e "\r                                                                              "
                echo ""
                
                # Show last few lines of log
                if [ -f /tmp/emulator-install.log ]; then
                    echo -e "${GREEN}Installation log:${NC}"
                    tail -5 /tmp/emulator-install.log | while read line; do
                        echo "   $line"
                    done
                fi
                
                echo ""
                echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
                
                # Wait for installation to complete
                sleep 2
                
                # Check if installation succeeded
                if [ -f "$ANDROID_HOME/emulator/emulator" ]; then
                    echo ""
                    print_status "Emulator tool installed successfully!"
                    echo -e "   ${GREEN}Location: $ANDROID_HOME/emulator/emulator${NC}"
                    export PATH="$ANDROID_HOME/emulator:$PATH"
                elif command -v emulator &> /dev/null; then
                    echo ""
                    print_status "Emulator tool installed successfully!"
                    export PATH="$ANDROID_HOME/emulator:$PATH"
                else
                    echo ""
                    print_error "Failed to install emulator tool"
                    echo ""
                    echo -e "${YELLOW}Please try manually:${NC}"
                    echo -e "   ${GREEN}sdkmanager --install emulator${NC}"
                    echo ""
                    echo -e "${YELLOW}Or install Android Studio:${NC}"
                    echo -e "   ${BLUE}https://developer.android.com/studio${NC}"
                    echo ""
                    read -p "Continue anyway? (y/N): " continue_choice
                    if [[ ! $continue_choice =~ ^[Yy]$ ]]; then
                        exit 1
                    fi
                fi
                echo ""
            else
                print_status "Emulator tool already installed"
                echo ""
            fi
            
            # Check if avdmanager exists
            if ! command -v avdmanager &> /dev/null; then
                print_info "Installing AVD Manager..."
                yes | sdkmanager --install "cmdline-tools;latest" 2>&1 | while IFS= read -r line; do
                    if [[ $line =~ "Downloading" ]] || [[ $line =~ "Installing" ]] || [[ $line =~ "Done" ]]; then
                        echo "   $line"
                    fi
                done
                echo ""
            fi
            
            # Check if system images are available
            echo -e "${YELLOW}╔════════════════════════════════════════════════════════╗${NC}"
            echo -e "${YELLOW}║  📱 Android 34 System Image                           ║${NC}"
            echo -e "${YELLOW}╚════════════════════════════════════════════════════════╝${NC}"
            echo ""
            
            print_info "Checking for Android 34 system image..."
            
            # Check if already installed
            if sdkmanager --list 2>/dev/null | grep -q "system-images;android-34;google_apis;x86_64" && \
               [ -d "$ANDROID_HOME/system-images/android-34/google_apis/x86_64" ]; then
                print_status "System image already installed ✓"
                echo -e "   ${GREEN}Location: $ANDROID_HOME/system-images/android-34/google_apis/x86_64${NC}"
                echo ""
            else
                echo -e "${BLUE}System Image Details:${NC}"
                echo -e "   Name: Android 34 (Tiramisu)"
                echo -e "   Architecture: x86_64"
                echo -e "   Type: Google APIs"
                echo -e "   Package: system-images;android-34;google_apis;x86_64"
                echo -e "   Size: ~700-800 MB"
                echo -e "   Est. Time: 2-5 minutes"
                echo ""
                
                print_info "Starting download..."
                echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
                echo ""
                
                # Download using --install flag in background
                yes | sdkmanager --verbose --install "system-images;android-34;google_apis;x86_64" > /tmp/sysimg-install.log 2>&1 &
                INSTALL_PID=$!
                
                # Show animated spinner with download progress
                SPINNER=("⠋" "⠙" "⠹" "⠸" "⠼" "⠴" "⠦" "⠧" "⠇" "⠏")
                ELAPSED=0
                LAST_STATUS=""
                
                while kill -0 $INSTALL_PID 2>/dev/null; do
                    # Check log file for download progress
                    if [ -f /tmp/sysimg-install.log ]; then
                        # Try multiple patterns to extract download progress
                        # Pattern 1: "450 MB / 715 MB" or "450.5 MB / 715.0 MB"
                        DOWNLOAD_INFO=$(tail -30 /tmp/sysimg-install.log 2>/dev/null | grep -a -oE "[0-9]+(\.[0-9]+)?\s*[KMG]?B\s*/\s*[0-9]+(\.[0-9]+)?\s*[KMG]?B" 2>/dev/null | tail -1)
                        
                        # Pattern 2: Percentage like "50%" or "[=====     ] 50%"
                        if [ -z "$DOWNLOAD_INFO" ]; then
                            DOWNLOAD_INFO=$(tail -10 /tmp/sysimg-install.log 2>/dev/null | grep -a -oE "[0-9]+%" 2>/dev/null | tail -1)
                        fi
                        
                        if [ ! -z "$DOWNLOAD_INFO" ]; then
                            LAST_STATUS="$DOWNLOAD_INFO"
                        else
                            # Check for status messages
                            STATUS_LINE=$(tail -10 /tmp/sysimg-install.log 2>/dev/null | grep -a -iE "download|install|fetch|unzip|prepar" 2>/dev/null | tail -1 | cut -c1-40)
                            if [ ! -z "$STATUS_LINE" ]; then
                                LAST_STATUS="$STATUS_LINE"
                            fi
                        fi
                    fi
                    
                    for SPIN in "${SPINNER[@]}"; do
                        if ! kill -0 $INSTALL_PID 2>/dev/null; then
                            break
                        fi
                        echo -ne "\r   ${YELLOW}${SPIN} System image (~700 MB)... ${ELAPSED}s ${GREEN}${LAST_STATUS}${NC}                              "
                        sleep 1
                        ELAPSED=$((ELAPSED + 1))
                    done
                done
                
                # Wait for completion
                wait $INSTALL_PID
                INSTALL_STATUS=$?
                
                echo -e "\r                                                                                          "
                echo ""
                
                # Show last few lines of log
                if [ -f /tmp/sysimg-install.log ]; then
                    echo -e "${GREEN}Installation log:${NC}"
                    tail -5 /tmp/sysimg-install.log | while read line; do
                        echo "   $line"
                    done
                fi
                
                echo ""
                echo ""
                
                # Verify installation
                if [ -d "$ANDROID_HOME/system-images/android-34/google_apis/x86_64" ]; then
                    echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
                    print_status "System image downloaded successfully!"
                    echo ""
                else
                    echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
                    print_error "System image download failed"
                    echo ""
                    echo -e "${YELLOW}Please try manually:${NC}"
                    echo -e "   ${GREEN}sdkmanager --install \"system-images;android-34;google_apis;x86_64\"${NC}"
                    echo ""
                    echo -e "${YELLOW}Or use Android Studio SDK Manager${NC}"
                    echo ""
                    read -p "Continue anyway? (y/N): " continue_choice
                    if [[ ! $continue_choice =~ ^[Yy]$ ]]; then
                        exit 1
                    fi
                    echo ""
                fi
            fi
            
            # Create AVD
            echo -e "${YELLOW}╔════════════════════════════════════════════════════════╗${NC}"
            echo -e "${YELLOW}║  🎨 Creating Virtual Device (AVD)                     ║${NC}"
            echo -e "${YELLOW}╚════════════════════════════════════════════════════════╝${NC}"
            echo ""
            echo -e "${BLUE}Device Configuration:${NC}"
            echo -e "   Base Device: Pixel 5"
            echo -e "   Screen: 6.0\" 1080x2340 (440 dpi)"
            echo -e "   RAM: 8 GB"
            echo -e "   Storage: 6 GB"
            echo -e "   Android Version: 14 (API 34)"
            echo ""
            read -p "Enter emulator name (default: TestDevice): " emu_name
            emu_name=${emu_name:-TestDevice}
            
            print_info "Creating AVD: $emu_name"
            echo no | avdmanager create avd -n "$emu_name" \
                -k "system-images;android-34;google_apis;x86_64" \
                --device "pixel_5" 2>&1 | grep -v "null"
            
            if [ $? -eq 0 ]; then
                echo ""
                print_status "Emulator '$emu_name' created successfully! ✓"
                echo -e "   ${GREEN}Type: Android Virtual Device (AVD)${NC}"
                echo -e "   ${GREEN}Name: $emu_name${NC}"
                echo -e "   ${GREEN}System: Android 14 (API 34)${NC}"
                echo -e "   ${GREEN}Architecture: x86_64${NC}"
                SELECTED_EMU="$emu_name"
                
                # Ask if user wants to start it now
                echo ""
                echo -e "${YELLOW}╔════════════════════════════════════════════════════════╗${NC}"
                echo -e "${YELLOW}║  🚀 Launch Emulator Now?                              ║${NC}"
                echo -e "${YELLOW}╚════════════════════════════════════════════════════════╝${NC}"
                echo ""
                read -p "Start emulator and install app now? (Y/n): " start_now
                if [[ ! $start_now =~ ^[Nn]$ ]]; then
                    # Check if emulator is already running
                    if adb devices | grep -q "emulator"; then
                        print_status "An emulator is already running"
                    else
                        echo ""
                        echo -e "${BLUE}Starting emulator: $SELECTED_EMU${NC}"
                        echo -e "${YELLOW}⏳ This may take 2-3 minutes for first boot...${NC}"
                        echo ""
                        
                        # Start emulator in background
                        "$ANDROID_HOME/emulator/emulator" -avd "$SELECTED_EMU" -no-snapshot-load &
                        EMULATOR_PID=$!
                        
                        # Wait for emulator to boot
                        print_info "Waiting for emulator to initialize..."
                        adb wait-for-device
                        
                        # Wait for boot to complete with better feedback
                        print_info "Booting Android system"
                        BOOT_WAIT=0
                        while [ "$(adb shell getprop sys.boot_completed 2>/dev/null | tr -d '\r')" != "1" ]; do
                            sleep 2
                            BOOT_WAIT=$((BOOT_WAIT + 2))
                            echo -ne "\r   ${YELLOW}⏱  Booting... ${BOOT_WAIT}s elapsed${NC}"
                        done
                        echo ""
                        print_status "Emulator booted successfully! (${BOOT_WAIT}s)"
                    fi
                    
                    # Install app on emulator
                    echo ""
                    print_info "Installing app on emulator..."
                    sleep 2
                    ./gradlew installDebug --quiet
                    
                    if [ $? -eq 0 ]; then
                        print_status "App installed on emulator!"
                        echo ""
                        echo -e "${GREEN}════════════════════════════════${NC}"
                        echo -e "${GREEN}     🎉 SETUP COMPLETE! 🎉${NC}"
                        echo -e "${GREEN}════════════════════════════════${NC}"
                        
                        # Auto-launch app
                        sleep 1
                        adb shell am start -n com.example.myapplication/.SplashActivity
                        print_status "App launched on emulator!"
                    else
                        print_error "Installation failed"
                    fi
                else
                    echo ""
                    echo -e "${GREEN}Emulator created!${NC}"
                    echo -e "${YELLOW}To start it later:${NC}"
                    echo "   emulator -avd $emu_name"
                    echo ""
                    echo -e "${YELLOW}To install app:${NC}"
                    echo "   ./gradlew installDebug"
                fi
            else
                print_error "Failed to create emulator"
                echo ""
                echo -e "${YELLOW}You can create one manually:${NC}"
                echo "   1. Install Android Studio"
                echo "   2. Open Tools → Device Manager"
                echo "   3. Create a new Virtual Device"
                exit 1
            fi
            ;;
            
        skip)
            echo -e "${BLUE}APK built at: app/build/outputs/apk/debug/app-debug.apk${NC}"
            echo ""
            echo -e "${YELLOW}To install later:${NC}"
            echo "   ./gradlew installDebug"
            ;;
            
        *)
            print_error "Invalid option"
            ;;
    esac
fi

# 7. Add environment variables to shell config
SHELL_CONFIG=""
if [ -f "$HOME/.zshrc" ]; then
    SHELL_CONFIG="$HOME/.zshrc"
elif [ -f "$HOME/.bashrc" ]; then
    SHELL_CONFIG="$HOME/.bashrc"
fi

if [ ! -z "$SHELL_CONFIG" ]; then
    if ! grep -q "ANDROID_HOME" "$SHELL_CONFIG"; then
        echo "" >> "$SHELL_CONFIG"
        echo "# Android SDK" >> "$SHELL_CONFIG"
        echo "export ANDROID_HOME=$ANDROID_SDK" >> "$SHELL_CONFIG"
        echo "export PATH=\$ANDROID_HOME/cmdline-tools/latest/bin:\$ANDROID_HOME/platform-tools:\$PATH" >> "$SHELL_CONFIG"
        print_status "Environment variables added to $SHELL_CONFIG"
    fi
fi

# 8. Optional: Install VS Code Extensions
echo ""
print_info "VS Code Extensions (Optional)..."
if command -v code &> /dev/null; then
    read -p "Install VS Code Kotlin & Java extensions? (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        print_info "Installing VS Code extensions..."
        code --install-extension mathiasfrohlich.kotlin 2>/dev/null
        code --install-extension vscjava.vscode-java-pack 2>/dev/null
        code --install-extension redhat.java 2>/dev/null
        print_status "VS Code extensions installed"
    else
        echo -e "   ${YELLOW}Skipped VS Code extensions${NC}"
    fi
else
    echo -e "   ${YELLOW}VS Code not found. Skipping extensions.${NC}"
fi

echo ""
print_info "Quick commands:"
echo "   Build:   ./gradlew assembleDebug"
echo "   Install: ./gradlew installDebug"
echo "   Clean:   ./gradlew clean"
echo "   Logs:    cat build.log"
echo ""
