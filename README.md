# 🚀 Android Kotlin Template# 🚀 Android Kotlin Template



<div align="center"><div align="center">



[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

[![Kotlin](https://img.shields.io/badge/Kotlin-1.9.0-purple.svg)](https://kotlinlang.org/)[![Kotlin](https://img.shields.io/badge/Kotlin-1.9.0-purple.svg)](https://kotlinlang.org/)

[![Android](https://img.shields.io/badge/Android-SDK%2034-green.svg)](https://developer.android.com/)[![Android](https://img.shields.io/badge/Android-SDK%2034-green.svg)](https://developer.android.com/)

[![Gradle](https://img.shields.io/badge/Gradle-8.12-blue.svg)](https://gradle.org/)[![Gradle](https://img.shields.io/badge/Gradle-8.12-blue.svg)](https://gradle.org/)



**Professional Android Kotlin project template with Vite-style workflow****Professional Android Kotlin project generator with Vite-style workflow**



Generate production-ready Android apps with modern features in seconds!Generate production-ready Android apps with animated splash screens in seconds!



[Quick Start](#-quick-start) • [Features](#-features) • [Installation](#-complete-installation-guide) • [Usage](#-usage-guide) • [Documentation](#-documentation)[Quick Start](#-quick-start) • [Features](#-features) • [Documentation](#-documentation)



</div></div>



------



## 📋 Table of Contents## 🎯 What is This?



- [What is This?](#-what-is-this)A **Vite-style project generator** for Android Kotlin applications - just like `create-react-app` or `create-next-app`, but for Android! This repository serves dual purposes:

- [Key Features](#-key-features)

- [Prerequisites](#-prerequisites)1. **📦 Template Repository** - Complete Android Kotlin project template

- [Quick Start](#-quick-start)2. **🛠️ Generator Script** - Tool to create new projects from this template

- [Complete Installation Guide](#-complete-installation-guide)

- [Automated Setup Script](#-automated-setup-script-features)---

- [Usage Guide](#-usage-guide)

- [App Features Explained](#-app-features-explained)## ⚡ Quick Start

- [Project Structure](#-project-structure)

- [Customization Guide](#-customization-guide)### Method 1: One-Line Install (Recommended)

- [Build & Deployment](#-build--deployment)

- [Troubleshooting](#-troubleshooting)```bash

- [Advanced Topics](#-advanced-topics)bash <(curl -fsSL https://raw.githubusercontent.com/satyam16-ai/android-kotlin-template/main/create-android-app.sh)

- [Contributing](#-contributing)```



---### Method 2: Clone and Use as Template



## 🎯 What is This?```bash

# Clone this repository

**Android Kotlin Template** is a **Vite-style project generator** for Android applications - just like `create-react-app`, `create-next-app`, or `create-vite`, but specifically designed for Android! git clone https://github.com/satyam16-ai/android-kotlin-template.git MyAwesomeApp

cd MyAwesomeApp

This repository provides:

# Build and run

1. **📦 Complete Template** - Production-ready Android Kotlin project with all essential features./setup.sh

2. **🛠️ Smart Generator** - Automated tool to create new projects from this template```

3. **🚀 Intelligent Setup** - Automated script that handles SDK installation, emulator setup, and device deployment

4. **🎨 Modern UI** - Material Design 3 with dark theme support and adaptive icons### Method 3: Global Install

5. **📱 Best Practices** - Industry-standard architecture and code organization

```bash

### Why Choose This Template?sudo curl -fsSL https://raw.githubusercontent.com/satyam16-ai/android-kotlin-template/main/create-android-app.sh \

  -o /usr/local/bin/create-android-app

✅ **Zero Configuration** - Start coding immediately with all dependencies configured  sudo chmod +x /usr/local/bin/create-android-app

✅ **Modern Architecture** - ViewBinding, SharedPreferences, proper resource management  

✅ **Production Ready** - Includes splash screen, dark theme, network checker, and more  # Now use anywhere

✅ **Smart Deployment** - Automated emulator creation or physical device installation  create-android-app

✅ **Beautiful Icon** - Adaptive launcher icon with Kotlin branding  ```

✅ **Well Documented** - Comprehensive guides and inline code comments  

✅ **Beginner Friendly** - Perfect for learning Android development  ---

✅ **Time Saver** - Skip the boilerplate and focus on your app logic  

## ✨ Features

---

### 🎨 App Features

## ✨ Key Features- ✅ **Animated Splash Screen** - Professional 2.5s scale/fade animation

- ✅ **Share App Functionality** - Built-in app sharing via Intent

### 🎨 App Features (Built-in)- ✅ **SharedPreferences** - Theme persistence & settings storage

- ✅ **Snackbar Notifications** - Success/error user feedback

| Feature | Description | Status |- ✅ **App Info Dialog** - Version, author, and license information

|---------|-------------|--------|- ✅ **Network Status Checker** - Real-time connectivity detection

| **Animated Splash Screen** | Professional 2.5s scale + fade animation with custom branding | ✅ |- ✅ **Dark Theme Support** - Theme toggle with persistence

| **Custom Launcher Icon** | Adaptive icon with Kotlin logo, supports all densities | ✅ |- ✅ **Material Design 3** - Modern UI components

| **Dark Theme Support** | Toggle between light/dark themes with persistence | ✅ |- ✅ **ViewBinding** - Type-safe view access

| **Share App Functionality** | Built-in sharing via Android Intent | ✅ |

| **App Info Dialog** | Displays version, author, license with icons | ✅ |### 🛠️ Development Features

| **Network Status Checker** | Real-time connectivity detection with visual feedback | ✅ |- ✅ **Kotlin Native** - 100% Kotlin

| **SharedPreferences** | Persistent storage for settings and preferences | ✅ |- ✅ **Gradle 8.12** - Latest build system

| **Snackbar Notifications** | User feedback for success/error states | ✅ |- ✅ **Android SDK 34** - Target latest Android (Min SDK 21)

| **Material Design 3** | Latest Material components and theming | ✅ |- ✅ **Enhanced Setup Script** - 3-option deployment system:

| **ViewBinding** | Type-safe view access (no more findViewById!) | ✅ |  - 📱 Physical device detection & installation

  - 🖥️ **Emulator auto-installation & creation**

### 🛠️ Development Features  - ⏭️ Skip installation option

- ✅ **Production Ready** - Best practices included

| Feature | Description | Version |

|---------|-------------|---------|> 📖 **New!** Check [SETUP_FEATURES.md](SETUP_FEATURES.md) for complete setup script documentation

| **Kotlin Native** | 100% Kotlin codebase | 1.9.0 |

| **Android Gradle Plugin** | Latest build system | 8.8.0 |---

| **Target SDK** | Android 14 (API 34) | 34 |

| **Min SDK** | Android 5.0 (Lollipop) | 21 |## 📦 What's Inside

| **Gradle Version** | Latest stable | 8.12 |

| **Compile SDK** | Latest Android features | 34 |```

android-kotlin-template/

### 🚀 Automation Features├── create-android-app.sh         # Project generator

├── setup.sh                       # Automated setup

| Feature | Description |├── app/                           # Android application

|---------|-------------|│   ├── src/main/

| **Smart Device Detection** | Automatically detects connected physical devices |│   │   ├── java/.../

| **Emulator Auto-Installation** | Downloads and installs Android Emulator if needed |│   │   │   ├── SplashActivity.kt

| **System Image Download** | Downloads Android 34 system image automatically |│   │   │   └── MainActivity.kt

| **AVD Creation** | Creates and configures Android Virtual Device |│   │   └── res/                   # Resources

| **Progress Indicators** | Animated spinners with download progress |│   └── build.gradle

| **Error Handling** | Comprehensive error detection and user guidance |├── gradle/                        # Gradle wrapper

| **3-Option Menu** | Physical Device / Emulator / Skip installation |└── build.gradle

```

---

---

## 📋 Prerequisites

## 🎬 Usage

### Required Software

### Generate New Project

Before starting, ensure you have:

```bash

1. **Operating System**./create-android-app.sh

   - Linux (Ubuntu, Debian, Fedora, etc.)

   - macOS (with Homebrew)# Enter details:

   - Windows (WSL2 recommended)# Project name: MyApp

# Package name: com.example.myapp

2. **Java Development Kit (JDK)**# App display name: My App

   - JDK 8+ required```

   - JDK 11 or 17 recommended

   - JDK 25 tested and working### Build & Install

   

   ```bash```bash

   # Check Java versioncd MyApp

   java -version./setup.sh  # Automated build & install

   ```

   # Install on Ubuntu/Debian

   sudo apt install openjdk-17-jdk---

   

   # Install on macOS## 🔧 Requirements

   brew install openjdk@17

   ```- **Java JDK** 8+ (tested with Java 25)

- **Android SDK** (auto-installed)

3. **Git** (for cloning the repository)- **Gradle** 8.12+ (included)

   ```bash- **Git** (for cloning)

   # Ubuntu/Debian

   sudo apt install git**Target Devices:**

   - Min SDK: Android 5.0 (API 21)

   # macOS- Target SDK: Android 14 (API 34)

   brew install git

   ```---



4. **Curl** (for one-line installation)## 📱 Manual Build

   ```bash

   # Usually pre-installed, verify with:```bash

   curl --version# Build APK

   ```./gradlew assembleDebug



### Optional (Auto-Installed by Setup Script)# Install on device

./gradlew installDebug

The following will be automatically installed by `setup.sh` if not present:

# Clean build

- ✅ Android SDK Command-line Tools./gradlew clean

- ✅ Android SDK Platform Tools (adb)```

- ✅ Android Build Tools

- ✅ Android Platform SDK 34**APK Location:** `app/build/outputs/apk/debug/app-debug.apk`

- ✅ Android Emulator

- ✅ System Images (Android 34 x86_64)---



### Device Requirements## 🎨 Customization



**For Physical Device:**### Change Package Name

- Android 5.0+ (API 21+)

- USB Debugging enabled```bash

- USB cable for connectionfind . -type f \( -name "*.kt" -o -name "*.xml" -o -name "*.gradle" \) \

  -exec sed -i 's/com\.example\.myapplication/com.your.package/g' {} +

**For Emulator:**```

- 8GB RAM minimum (16GB recommended)

- Hardware virtualization enabled (Intel VT-x / AMD-V)### Update App Name

- 10GB free disk space

Edit `app/src/main/res/values/strings.xml`:

---```xml

<string name="app_name">Your App</string>

## ⚡ Quick Start```



Choose your preferred installation method:---



### Method 1: One-Line Install (Recommended) ⚡## 🐛 Troubleshooting



Perfect for first-time users. This method:### Build Failures

- Downloads the generator script```bash

- Prompts for your app details./gradlew clean build

- Creates a new project```

- Sets up everything automatically

### Device Not Detected

```bash```bash

bash <(curl -fsSL https://raw.githubusercontent.com/satyam16-ai/android-kotlin-template/main/create-android-app.sh)adb devices

```adb kill-server && adb start-server

```

**Interactive Prompts:**

```### Installation Failed

Enter project name (e.g., MyApp): TaskManager- Enable **USB Debugging**

Enter package name (e.g., com.example.myapp): com.mycompany.tasks- Enable **Install via USB** (Xiaomi)

Enter app display name (e.g., My Application): Task Manager- Check storage space

```

---

### Method 2: Manual Clone 📦

## 📚 Documentation

For developers who want to inspect the template first:

- [Security Policy](SECURITY.md)

```bash- [Contributing](CONTRIBUTING.md)

# Clone the repository- [Changelog](CHANGELOG.md)

git clone https://github.com/satyam16-ai/android-kotlin-template.git MyAwesomeApp- [License](LICENSE)



# Navigate to project directory---

cd MyAwesomeApp

## 🚀 Deployment

# Run automated setup

./setup.sh```bash

```# Build release

./gradlew assembleRelease

### Method 3: Global Install 🌐

# Sign APK

Install the generator globally to use anywhere on your system:keytool -genkey -v -keystore release-key.jks \

  -keyalg RSA -keysize 2048 -validity 10000

```bash```

# Download and install globally

sudo curl -fsSL https://raw.githubusercontent.com/satyam16-ai/android-kotlin-template/main/create-android-app.sh \---

  -o /usr/local/bin/create-android-app

## 📊 Stats

# Make it executable

sudo chmod +x /usr/local/bin/create-android-app- **Build Time:** ~6 seconds

- **APK Size:** ~5.3MB

# Now use it anywhere!- **Supported Devices:** 95%+ of Android devices

cd ~/Projects

create-android-app---

```

## 🎯 Roadmap

---

- [x] Animated splash screens

## 📦 Complete Installation Guide- [x] Material Design 3

- [x] Automated setup script

### Step-by-Step Installation Process- [ ] Jetpack Compose support

- [ ] ViewBinding support

#### Step 1: Download the Template- [ ] Dark theme

- [ ] Firebase templates

Choose one of the methods above. For this guide, we'll use Method 2:- [ ] Room database boilerplate

- [ ] Navigation component

```bash- [ ] Retrofit networking setup

git clone https://github.com/satyam16-ai/android-kotlin-template.git MyApp- [ ] Unit test templates

cd MyApp- [ ] MVVM architecture

```

---

#### Step 2: Review Project Structure

## �‍💻 Author

```bash

# List project contents**Satyam**

ls -la- GitHub: [@satyam16-ai](https://github.com/satyam16-ai)

- Repository: [android-kotlin-template](https://github.com/satyam16-ai/android-kotlin-template)

# You should see:

# - setup.sh (automated setup script)---

# - create-android-app.sh (project generator)

# - app/ (Android application code)## �📜 License

# - gradle/ (Gradle wrapper)

# - build.gradle (build configuration)MIT License - see [LICENSE](LICENSE) file

```

---

#### Step 3: Make Setup Script Executable

## 🤝 Contributing

```bash

chmod +x setup.shContributions, issues, and feature requests are welcome!  

```Feel free to check [issues page](https://github.com/satyam16-ai/android-kotlin-template/issues).



#### Step 4: Run the Setup Script---



```bash## ⭐ Show Your Support

./setup.sh

```Give a ⭐ if this project helped you!



#### Step 5: Follow the Interactive Menu---



The setup script will guide you through:<div align="center">



**Stage 1: Environment Detection****Made with ❤️ for Android developers by Satyam**

```

🔍 Checking Java installation...[Report Bug](https://github.com/satyam16-ai/android-kotlin-template/issues) • [Request Feature](https://github.com/satyam16-ai/android-kotlin-template/issues) • [Discussions](https://github.com/satyam16-ai/android-kotlin-template/discussions)

✓ Java 17 detected

</div>

🔍 Checking Android SDK...
✓ Android SDK found at: /home/user/Android/Sdk

🔍 Detecting connected devices...
✓ Found 1 physical device
```

**Stage 2: Device Selection Menu**
```
📱 Select deployment target:

  1) Physical Device: Xiaomi 2201116TI (Android 13)
  2) Android Emulator (Create new)
  3) Skip installation (build only)

Enter your choice [1-3]: 
```

**Stage 3: Build Process**
```
🏗️  Building APK...
⏳ This may take a few moments...

BUILD SUCCESSFUL in 6s
✓ APK built successfully
```

**Stage 4: Installation**
```
📲 Installing on device...
✓ App installed successfully!
✓ App launched!
```

#### Step 6: Verify Installation

Check your device:
- Look for the app icon with Kotlin "K" logo
- Launch the app
- You should see a splash screen followed by the main screen

---

## 🚀 Automated Setup Script Features

The `setup.sh` script is an intelligent automation tool that handles the entire development environment setup. Here's what it does:

### Features Overview

1. **Environment Verification**
   - Checks for Java installation (JDK 8+)
   - Verifies Android SDK installation
   - Detects Android SDK location automatically
   - Validates required SDK components

2. **Smart Device Detection**
   - Scans for connected physical devices via ADB
   - Detects available Android emulators
   - Shows device details (model, Android version, API level)
   - Handles multiple devices gracefully

3. **Emulator Auto-Installation** ⭐ NEW!
   - Downloads Android Command-line Tools if missing
   - Installs Android Emulator package automatically
   - Downloads system image (Android 34 x86_64)
   - Creates and configures AVD with optimal settings
   - Shows real-time progress with animated spinner
   - Displays download progress (elapsed time)

4. **3-Option Deployment Menu**
   ```
   Option 1: Deploy to Physical Device
   - Auto-detects connected devices
   - Installs APK directly
   - Launches app automatically
   
   Option 2: Create & Use Emulator
   - Installs emulator if needed
   - Downloads system image
   - Creates AVD with name "AndroidKotlinTemplate"
   - Boots emulator
   - Waits for boot completion
   - Installs and launches app
   
   Option 3: Skip Installation
   - Builds APK only
   - Shows APK location
   - Useful for CI/CD or manual testing
   ```

5. **Progress Indicators**
   - Animated spinner during long operations
   - Elapsed time counter
   - Download progress (when available)
   - Clear status messages

6. **Error Handling**
   - Detects missing dependencies
   - Provides clear error messages
   - Suggests solutions for common issues
   - Graceful fallback options

### Usage Examples

**Install on Physical Device:**
```bash
./setup.sh
# Select option 1
# App automatically installed and launched
```

**Create New Emulator:**
```bash
./setup.sh
# Select option 2
# Emulator created, booted, and app launched
# (First time: ~800MB download for system image)
```

**Build Only:**
```bash
./setup.sh
# Select option 3
# APK built at: app/build/outputs/apk/debug/app-debug.apk
```

### Advanced Setup Options

**Force Clean Build:**
```bash
./gradlew clean
./setup.sh
```

**Rebuild Without Installation:**
```bash
./gradlew assembleDebug
```

**Install Specific APK:**
```bash
adb install -r app/build/outputs/apk/debug/app-debug.apk
```

> 📖 **Detailed Documentation:** See [SETUP_FEATURES.md](SETUP_FEATURES.md) for complete setup script documentation with screenshots and troubleshooting.

---

## 💻 Usage Guide

### Running Your App

#### Option 1: Using Setup Script (Recommended)
```bash
./setup.sh
```

#### Option 2: Using Gradle Commands
```bash
# Build and install on connected device
./gradlew installDebug

# Build APK only
./gradlew assembleDebug

# Clean build
./gradlew clean build
```

#### Option 3: Using Android Studio
1. Open Android Studio
2. File → Open → Select project folder
3. Wait for Gradle sync
4. Click Run ▶️ button (or Shift + F10)
5. Select device from dropdown

### Development Workflow

**1. Make Code Changes**
```bash
# Edit files in:
# - app/src/main/java/com/example/myapplication/
# - app/src/main/res/
```

**2. Build and Test**
```bash
./setup.sh
# or
./gradlew installDebug
```

**3. View Logs**
```bash
# Real-time logs
adb logcat | grep "MyApp"

# Filter by tag
adb logcat -s MainActivity
```

**4. Uninstall App**
```bash
adb uninstall com.example.myapplication
```

---

## 🎨 App Features Explained

### 1. Animated Splash Screen

**Location:** `SplashActivity.kt`

A professional splash screen that displays for 2.5 seconds with:
- Scale animation (0.5x to 1.0x)
- Fade animation (invisible to visible)
- Automatic transition to MainActivity

```kotlin
// Customization: Change duration
postDelayed({ /* transition */ }, 2500) // milliseconds
```

### 2. Custom Launcher Icon

**Location:** 
- `res/mipmap-*/ic_launcher.png` (PNG icons)
- `res/mipmap-anydpi-v26/ic_launcher.xml` (Adaptive icon)
- `res/drawable/ic_launcher_background.xml` (Background layer)
- `res/drawable/ic_launcher_foreground_new.xml` (Foreground layer)

Features:
- Adaptive icon support (Android 8.0+)
- Kotlin "K" logo in white
- Purple gradient background (#7F52FF → #6200EE)
- All density sizes (mdpi to xxxhdpi)
- Round icon variants

**Customization:** Replace PNG files or edit vector drawables to use your own branding.

### 3. Dark Theme Support

**Location:** `res/values-night/colors.xml`, `MainActivity.kt`

Toggle between light and dark themes:
- Click "Toggle Theme" button
- Theme preference saved automatically
- Persists across app restarts
- Material Design 3 color schemes

```kotlin
// Implementation uses:
- SharedPreferences for persistence
- AppCompatDelegate.setDefaultNightMode()
- Material color resources
```

### 4. Share App Feature

**Location:** `MainActivity.kt` → `shareApp()`

Allows users to share your app:
- Creates share Intent
- Includes Play Store link (when published)
- Shares app name and description
- Opens system share sheet

**Customization:** Update Play Store URL after publishing.

### 5. App Info Dialog

**Location:** `MainActivity.kt` → `showAppInfoDialog()`

Displays app information:
- App version (from BuildConfig)
- Author name
- License type
- Professional alert dialog with icon

### 6. Network Status Checker

**Location:** `MainActivity.kt` → `checkNetworkStatus()`

Real-time connectivity detection:
- Checks WiFi and mobile data
- Shows Snackbar notification
- Green for connected, red for disconnected
- Requires INTERNET and ACCESS_NETWORK_STATE permissions

### 7. Snackbar Notifications

**Location:** Used throughout `MainActivity.kt`

User feedback system:
- Success messages (green)
- Error messages (red)
- Short duration (2 seconds)
- Material Design styling

### 8. SharedPreferences

**Location:** `MainActivity.kt` → `loadThemePreference()`, `saveThemePreference()`

Persistent data storage:
- Saves theme preference
- Automatically loads on app start
- Can be extended for other settings

```kotlin
// Usage example:
val prefs = getSharedPreferences("MyAppPrefs", Context.MODE_PRIVATE)
prefs.edit().putString("key", "value").apply()
```

### 9. ViewBinding

**Location:** Enabled in `app/build.gradle`, used in all activities

Type-safe view access:
```kotlin
// Old way (DON'T DO THIS):
val button = findViewById<Button>(R.id.button)

// ViewBinding way (RECOMMENDED):
binding.button.setOnClickListener { /* ... */ }
```

Benefits:
- Compile-time safety
- Null safety
- No findViewById() calls
- Auto-generated binding classes

---

## 📁 Project Structure

```
android-kotlin-template/
│
├── 📄 README.md                      # This file
├── 📄 LICENSE                         # MIT License
├── 📄 CHANGELOG.md                    # Version history
├── 📄 CONTRIBUTING.md                 # Contribution guidelines
├── 📄 SECURITY.md                     # Security policy
├── 📄 SETUP_FEATURES.md              # Setup script documentation
│
├── 🔧 setup.sh                        # Automated setup script
├── 🔧 create-android-app.sh          # Project generator
├── 📄 build.gradle                    # Root build configuration
├── 📄 settings.gradle                 # Project settings
├── 📄 gradle.properties               # Gradle properties
│
├── 📁 app/                            # Android application module
│   ├── 📄 build.gradle                # App-level build config
│   ├── 📄 proguard-rules.pro         # ProGuard rules
│   │
│   └── 📁 src/
│       └── 📁 main/
│           ├── 📄 AndroidManifest.xml # App manifest
│           │
│           ├── 📁 java/com/example/myapplication/
│           │   ├── 🎨 SplashActivity.kt      # Splash screen
│           │   └── 🎨 MainActivity.kt        # Main activity
│           │
│           └── 📁 res/                # Resources
│               ├── 📁 drawable/       # Vector drawables
│               │   ├── ic_launcher_background.xml
│               │   ├── ic_launcher_foreground.xml
│               │   └── ic_launcher_foreground_new.xml
│               │
│               ├── 📁 mipmap-mdpi/    # 48x48 icons
│               ├── 📁 mipmap-hdpi/    # 72x72 icons
│               ├── 📁 mipmap-xhdpi/   # 96x96 icons
│               ├── 📁 mipmap-xxhdpi/  # 144x144 icons
│               ├── 📁 mipmap-xxxhdpi/ # 192x192 icons
│               └── 📁 mipmap-anydpi-v26/  # Adaptive icons
│               │
│               ├── 📁 layout/
│               │   ├── activity_splash.xml   # Splash layout
│               │   └── activity_main.xml     # Main layout
│               │
│               ├── 📁 values/
│               │   ├── colors.xml            # Light theme colors
│               │   ├── strings.xml           # String resources
│               │   └── styles.xml            # App themes
│               │
│               └── 📁 values-night/
│                   └── colors.xml            # Dark theme colors
│
└── 📁 gradle/wrapper/                 # Gradle wrapper files
    ├── gradle-wrapper.jar
    └── gradle-wrapper.properties
```

### Key Files Explained

| File | Purpose |
|------|---------|
| `setup.sh` | Main automation script - builds, detects devices, installs app |
| `create-android-app.sh` | Generator script - creates new projects from template |
| `build.gradle` (root) | Root-level build configuration and plugin versions |
| `build.gradle` (app) | App-level dependencies, SDK versions, build types |
| `AndroidManifest.xml` | App permissions, activities, launcher configuration |
| `SplashActivity.kt` | Splash screen with animations |
| `MainActivity.kt` | Main app logic and all features |
| `activity_main.xml` | UI layout with Material components |
| `colors.xml` | Color definitions (light and dark themes) |
| `strings.xml` | All app strings (supports localization) |

---

## 🎨 Customization Guide

### 1. Change App Name

**File:** `app/src/main/res/values/strings.xml`

```xml
<resources>
    <string name="app_name">Your App Name</string>
</resources>
```

### 2. Change Package Name

**Method 1: Using Android Studio**
1. Right-click on package in Project view
2. Refactor → Rename
3. Select "Rename package"
4. Enter new package name
5. Click "Refactor"

**Method 2: Using Command Line**
```bash
# Replace all occurrences
find . -type f \( -name "*.kt" -o -name "*.xml" -o -name "*.gradle" \) \
  -exec sed -i 's/com\.example\.myapplication/com.yourcompany.yourapp/g' {} +

# Update folder structure
mv app/src/main/java/com/example/myapplication \
   app/src/main/java/com/yourcompany/yourapp
```

### 3. Customize Colors

**Light Theme:** `app/src/main/res/values/colors.xml`
```xml
<color name="purple_500">#6200EE</color>
<color name="purple_700">#3700B3</color>
<color name="teal_200">#03DAC5</color>
```

**Dark Theme:** `app/src/main/res/values-night/colors.xml`
```xml
<color name="purple_200">#BB86FC</color>
<color name="purple_700">#3700B3</color>
<color name="teal_200">#03DAC6</color>
```

### 4. Change Launcher Icon

**Option 1: Replace PNG files**
```bash
# Replace icons in each density folder:
app/src/main/res/mipmap-mdpi/ic_launcher.png     # 48x48
app/src/main/res/mipmap-hdpi/ic_launcher.png     # 72x72
app/src/main/res/mipmap-xhdpi/ic_launcher.png    # 96x96
app/src/main/res/mipmap-xxhdpi/ic_launcher.png   # 144x144
app/src/main/res/mipmap-xxxhdpi/ic_launcher.png  # 192x192
```

**Option 2: Use Android Studio Asset Studio**
1. Right-click `res` folder
2. New → Image Asset
3. Icon Type: Launcher Icons
4. Upload your icon
5. Configure foreground/background
6. Click "Finish"

**Option 3: Edit Vector Drawables**
Edit `drawable/ic_launcher_foreground_new.xml` and `drawable/ic_launcher_background.xml`

### 5. Add New Activity

```bash
# Create new Activity file
touch app/src/main/java/com/example/myapplication/NewActivity.kt

# Create layout file
touch app/src/main/res/layout/activity_new.xml

# Register in AndroidManifest.xml
```

**AndroidManifest.xml:**
```xml
<activity 
    android:name=".NewActivity"
    android:exported="false" />
```

### 6. Add Dependencies

**File:** `app/build.gradle`

```gradle
dependencies {
    // Example: Add Retrofit for networking
    implementation 'com.squareup.retrofit2:retrofit:2.9.0'
    implementation 'com.squareup.retrofit2:converter-gson:2.9.0'
    
    // Example: Add Room for database
    implementation 'androidx.room:room-runtime:2.6.0'
    kapt 'androidx.room:room-compiler:2.6.0'
}
```

Then sync Gradle:
```bash
./gradlew sync
```

### 7. Modify Splash Screen

**File:** `SplashActivity.kt`

```kotlin
// Change duration (milliseconds)
postDelayed({ /* ... */ }, 3000) // 3 seconds

// Change animation
imageView.animate()
    .scaleX(1.2f)  // Different scale
    .scaleY(1.2f)
    .alpha(1f)
    .setDuration(2000)  // Different duration
    .start()
```

### 8. Update App Version

**File:** `app/build.gradle`

```gradle
android {
    defaultConfig {
        versionCode 2      // Increment for each release
        versionName "1.1"  // User-visible version
    }
}
```

---

## 🏗️ Build & Deployment

### Development Builds

**Debug APK** (for testing):
```bash
# Build only
./gradlew assembleDebug

# Build and install
./gradlew installDebug

# Or use setup script
./setup.sh
```

APK Location: `app/build/outputs/apk/debug/app-debug.apk`

### Production Builds

**Step 1: Generate Signing Key**
```bash
keytool -genkey -v -keystore release-key.jks \
  -keyalg RSA -keysize 2048 -validity 10000 \
  -alias my-key-alias
```

**Step 2: Configure Signing**

Create `keystore.properties` in root:
```properties
storePassword=YourStorePassword
keyPassword=YourKeyPassword
keyAlias=my-key-alias
storeFile=../release-key.jks
```

**Step 3: Update build.gradle**

`app/build.gradle`:
```gradle
android {
    signingConfigs {
        release {
            def keystorePropertiesFile = rootProject.file("keystore.properties")
            def keystoreProperties = new Properties()
            keystoreProperties.load(new FileInputStream(keystorePropertiesFile))

            keyAlias keystoreProperties['keyAlias']
            keyPassword keystoreProperties['keyPassword']
            storeFile file(keystoreProperties['storeFile'])
            storePassword keystoreProperties['storePassword']
        }
    }
    
    buildTypes {
        release {
            signingConfig signingConfigs.release
            minifyEnabled true
            proguardFiles getDefaultProguardFile('proguard-android-optimize.txt'), 'proguard-rules.pro'
        }
    }
}
```

**Step 4: Build Release APK**
```bash
./gradlew assembleRelease
```

Release APK: `app/build/outputs/apk/release/app-release.apk`

### App Bundle (for Play Store)

```bash
./gradlew bundleRelease
```

Bundle: `app/build/outputs/bundle/release/app-release.aab`

### Testing Release Build

```bash
# Install release APK
adb install -r app/build/outputs/apk/release/app-release.apk

# Or
./gradlew installRelease
```

---

## 🐛 Troubleshooting

### Build Issues

**Problem: Gradle sync failed**
```bash
# Solution: Clean and rebuild
./gradlew clean
./gradlew build --refresh-dependencies
```

**Problem: OutOfMemoryError during build**
```bash
# Solution: Increase heap size
# Edit gradle.properties:
org.gradle.jvmargs=-Xmx4096m -XX:MaxMetaspaceSize=512m
```

**Problem: Kotlin compilation failed**
```bash
# Solution: Clear Kotlin cache
rm -rf ~/.gradle/caches/
./gradlew clean build
```

### Installation Issues

**Problem: Device not detected**
```bash
# Check connection
adb devices

# Restart ADB
adb kill-server
adb start-server

# Check USB debugging is enabled on device
```

**Problem: INSTALL_FAILED_UPDATE_INCOMPATIBLE**
```bash
# Solution: Uninstall old version first
adb uninstall com.example.myapplication
./setup.sh
```

**Problem: Permission denied on setup.sh**
```bash
# Solution: Make it executable
chmod +x setup.sh
./setup.sh
```

### Emulator Issues

**Problem: Emulator won't start**
```bash
# Check if emulator is installed
emulator -list-avds

# Start manually with verbose output
emulator -avd AndroidKotlinTemplate -verbose

# Check hardware virtualization
egrep -c '(vmx|svm)' /proc/cpuinfo
# Should return > 0
```

**Problem: Emulator is slow**
```bash
# Solution: Enable hardware acceleration
# For Linux: Install KVM
sudo apt install qemu-kvm

# Check KVM is working
kvm-ok
```

**Problem: Emulator installation stuck**
```bash
# Solution: Check logs
tail -f /tmp/emulator-install.log

# Or install manually
sdkmanager --install "emulator"
sdkmanager --install "system-images;android-34;google_apis;x86_64"
```

### Runtime Issues

**Problem: App crashes on launch**
```bash
# View crash logs
adb logcat | grep -i "exception"

# Or filter by package
adb logcat | grep "com.example.myapplication"

# Clear app data and retry
adb shell pm clear com.example.myapplication
```

**Problem: Network features not working**
```bash
# Check permissions in AndroidManifest.xml
# Should have:
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
```

**Problem: Dark theme not working**
```bash
# Verify values-night folder exists
ls app/src/main/res/values-night/

# Check colors.xml exists in values-night
```

### Setup Script Issues

**Problem: Java not found**
```bash
# Install Java
sudo apt install openjdk-17-jdk

# Verify installation
java -version
```

**Problem: Android SDK not found**
```bash
# Setup script will offer to install
# Or install manually:
# Download from: https://developer.android.com/studio#command-tools
# Extract to: ~/Android/Sdk/cmdline-tools/latest/
```

**Problem: No space left on device**
```bash
# Check available space
df -h

# Clean Gradle cache
./gradlew clean
rm -rf ~/.gradle/caches/

# Clean Android build cache
rm -rf app/build/
```

### Common Error Messages

| Error | Cause | Solution |
|-------|-------|----------|
| `JAVA_HOME is not set` | Java not configured | Export JAVA_HOME in ~/.bashrc |
| `SDK location not found` | SDK not installed | Run setup.sh or set ANDROID_HOME |
| `Device unauthorized` | USB debugging not authorized | Check device for authorization dialog |
| `Installation failed: INSTALL_FAILED_INSUFFICIENT_STORAGE` | Low device storage | Free up space on device |
| `Could not resolve all files for configuration` | Network/dependency issue | Check internet, run with --refresh-dependencies |

---

## 🔬 Advanced Topics

### CI/CD Integration

**GitHub Actions Example:**

`.github/workflows/build.yml`:
```yaml
name: Android CI

on: [push, pull_request]

jobs:
  build:
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v3
    
    - name: Set up JDK 17
      uses: actions/setup-java@v3
      with:
        java-version: '17'
        distribution: 'temurin'
    
    - name: Grant execute permission for gradlew
      run: chmod +x gradlew
    
    - name: Build with Gradle
      run: ./gradlew build
    
    - name: Upload APK
      uses: actions/upload-artifact@v3
      with:
        name: app-debug
        path: app/build/outputs/apk/debug/app-debug.apk
```

### Adding Jetpack Compose

```gradle
// app/build.gradle
android {
    buildFeatures {
        compose true
    }
    composeOptions {
        kotlinCompilerExtensionVersion = "1.5.3"
    }
}

dependencies {
    implementation platform('androidx.compose:compose-bom:2024.01.00')
    implementation 'androidx.compose.ui:ui'
    implementation 'androidx.compose.material3:material3'
    implementation 'androidx.compose.ui:ui-tooling-preview'
    implementation 'androidx.activity:activity-compose:1.8.2'
}
```

### Adding Navigation Component

```gradle
dependencies {
    implementation 'androidx.navigation:navigation-fragment-ktx:2.7.6'
    implementation 'androidx.navigation:navigation-ui-ktx:2.7.6'
}
```

### Adding Room Database

```gradle
dependencies {
    implementation 'androidx.room:room-runtime:2.6.1'
    implementation 'androidx.room:room-ktx:2.6.1'
    kapt 'androidx.room:room-compiler:2.6.1'
}
```

### Adding Retrofit for Networking

```gradle
dependencies {
    implementation 'com.squareup.retrofit2:retrofit:2.9.0'
    implementation 'com.squareup.retrofit2:converter-gson:2.9.0'
    implementation 'com.squareup.okhttp3:logging-interceptor:4.12.0'
}
```

### ProGuard Configuration

For production builds, optimize with ProGuard.

`app/proguard-rules.pro`:
```proguard
# Keep Retrofit interfaces
-keep interface * {
    @retrofit2.http.* <methods>;
}

# Keep Room entities
-keep class * extends androidx.room.RoomDatabase
-keep @androidx.room.Entity class *

# Keep Kotlin metadata
-keep class kotlin.Metadata { *; }
```

---

## 📚 Documentation

### Official Documentation
- [Kotlin Documentation](https://kotlinlang.org/docs/home.html)
- [Android Developer Guides](https://developer.android.com/guide)
- [Material Design 3](https://m3.material.io/)
- [Gradle User Manual](https://docs.gradle.org/)

### Project Documentation
- [CHANGELOG.md](CHANGELOG.md) - Version history and updates
- [CONTRIBUTING.md](CONTRIBUTING.md) - How to contribute to this project
- [SECURITY.md](SECURITY.md) - Security policies and reporting vulnerabilities
- [SETUP_FEATURES.md](SETUP_FEATURES.md) - Detailed setup script documentation
- [LICENSE](LICENSE) - MIT License details

### Useful Resources
- [Android Kotlin Fundamentals](https://developer.android.com/courses/kotlin-android-fundamentals/overview)
- [Kotlin Bootcamp for Programmers](https://developer.android.com/courses/kotlin-bootcamp/overview)
- [Material Components for Android](https://github.com/material-components/material-components-android)

---

## 📊 Project Stats

- **Build Time:** ~6 seconds (debug), ~15 seconds (release)
- **APK Size:** ~5.3 MB (debug), ~3.2 MB (release with ProGuard)
- **Minimum SDK:** API 21 (Android 5.0)
- **Target SDK:** API 34 (Android 14)
- **Device Coverage:** 95%+ of active Android devices
- **Code Quality:** 100% Kotlin, ViewBinding, Material Design 3

---

## 🗺️ Roadmap

### ✅ Completed Features
- [x] Animated splash screens
- [x] Custom adaptive launcher icon
- [x] Material Design 3 theming
- [x] Dark theme support with persistence
- [x] ViewBinding integration
- [x] Automated setup script with emulator support
- [x] Network status checker
- [x] Share app functionality
- [x] App info dialog

### 🚧 In Progress
- [ ] Jetpack Compose migration guide
- [ ] MVVM architecture example
- [ ] Room database integration example

### 🔮 Planned Features
- [ ] Firebase integration template
- [ ] Retrofit + Repository pattern example
- [ ] Navigation component integration
- [ ] Unit test templates and examples
- [ ] Hilt dependency injection setup
- [ ] Data Store integration (replace SharedPreferences)
- [ ] Coil/Glide image loading setup
- [ ] Offline-first architecture example
- [ ] Multi-module project structure
- [ ] Kotlin Coroutines best practices
- [ ] WorkManager integration
- [ ] Notification system example

### 💡 Feature Requests
Have an idea? [Open an issue](https://github.com/satyam16-ai/android-kotlin-template/issues/new) with the label `enhancement`.

---

## 👨‍💻 Author

**Satyam**
- GitHub: [@satyam16-ai](https://github.com/satyam16-ai)
- Repository: [android-kotlin-template](https://github.com/satyam16-ai/android-kotlin-template)
- Email: [Create an issue](https://github.com/satyam16-ai/android-kotlin-template/issues) for contact

---

## 📜 License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

```
MIT License

Copyright (c) 2024 Satyam

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
```

---

## 🤝 Contributing

Contributions are **welcome** and **appreciated**! Here's how you can help:

### Ways to Contribute

1. **Report Bugs** - Found a bug? [Open an issue](https://github.com/satyam16-ai/android-kotlin-template/issues/new?template=bug_report.md)
2. **Suggest Features** - Have an idea? [Request a feature](https://github.com/satyam16-ai/android-kotlin-template/issues/new?template=feature_request.md)
3. **Improve Documentation** - Fix typos, add examples, clarify instructions
4. **Submit Code** - Fix bugs, add features, improve performance
5. **Share** - Star ⭐ the repo and share with other developers

### Contribution Process

1. **Fork** the repository
2. **Create** a feature branch (`git checkout -b feature/AmazingFeature`)
3. **Commit** your changes (`git commit -m 'Add some AmazingFeature'`)
4. **Push** to the branch (`git push origin feature/AmazingFeature`)
5. **Open** a Pull Request

### Development Guidelines

- Follow Kotlin coding conventions
- Write meaningful commit messages
- Add comments for complex logic
- Test on multiple Android versions
- Update documentation if needed

See [CONTRIBUTING.md](CONTRIBUTING.md) for detailed guidelines.

---

## ⭐ Show Your Support

If this project helped you, please consider:

- ⭐ **Star** this repository
- 🍴 **Fork** it for your own projects
- 📢 **Share** it with other developers
- 💬 **Discuss** your experience in [Discussions](https://github.com/satyam16-ai/android-kotlin-template/discussions)
- 🐛 **Report** issues you encounter
- 💡 **Suggest** new features

Every star motivates me to maintain and improve this project!

---

## 🙏 Acknowledgments

- **Android Team** - For the amazing Android platform
- **JetBrains** - For Kotlin and amazing IDEs
- **Material Design Team** - For beautiful design system
- **Open Source Community** - For inspiration and support
- **Contributors** - Everyone who has contributed to this project

---

## 📞 Support & Community

### Get Help

- 📖 [Read the Documentation](#-documentation)
- 🐛 [Check Troubleshooting Section](#-troubleshooting)
- ❓ [Search Existing Issues](https://github.com/satyam16-ai/android-kotlin-template/issues)
- 💬 [Start a Discussion](https://github.com/satyam16-ai/android-kotlin-template/discussions)
- 📧 [Create a New Issue](https://github.com/satyam16-ai/android-kotlin-template/issues/new)

### Stay Updated

- 🔔 **Watch** this repository for updates
- ⭐ **Star** to bookmark for later
- 📰 Check [CHANGELOG.md](CHANGELOG.md) for version updates

---

<div align="center">

## 🚀 Ready to Build Something Amazing?

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/satyam16-ai/android-kotlin-template/main/create-android-app.sh)
```

**Made with ❤️ for Android developers by Satyam**

[⬆️ Back to Top](#-android-kotlin-template)

---

[![GitHub stars](https://img.shields.io/github/stars/satyam16-ai/android-kotlin-template?style=social)](https://github.com/satyam16-ai/android-kotlin-template/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/satyam16-ai/android-kotlin-template?style=social)](https://github.com/satyam16-ai/android-kotlin-template/network/members)
[![GitHub issues](https://img.shields.io/github/issues/satyam16-ai/android-kotlin-template)](https://github.com/satyam16-ai/android-kotlin-template/issues)

[Report Bug](https://github.com/satyam16-ai/android-kotlin-template/issues) • [Request Feature](https://github.com/satyam16-ai/android-kotlin-template/issues) • [Discussions](https://github.com/satyam16-ai/android-kotlin-template/discussions)

</div>
