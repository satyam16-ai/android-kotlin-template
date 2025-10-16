# 🚀 Android Kotlin Template

<div align="center">

[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Kotlin](https://img.shields.io/badge/Kotlin-1.9.0-purple.svg)](https://kotlinlang.org/)
[![Android](https://img.shields.io/badge/Android-SDK%2034-green.svg)](https://developer.android.com/)
[![Gradle](https://img.shields.io/badge/Gradle-8.12-blue.svg)](https://gradle.org/)

**Professional Android Kotlin project generator with Vite-style workflow**

Generate production-ready Android apps with modern features in seconds!

[Quick Start](#-quick-start) • [Features](#-features) • [Installation](#-complete-installation-guide) • [Customization](#-customization-guide) • [Documentation](#-documentation)

</div>

---

## 📋 Table of Contents

- [What is This?](#-what-is-this)
- [Quick Start](#-quick-start)
- [Features](#-features)
- [Complete Installation Guide](#-complete-installation-guide)
- [Automated Setup Script](#-automated-setup-script)
- [App Features Explained](#-app-features-explained)
- [Project Structure](#-project-structure)
- [Customization Guide](#-customization-guide)
- [Build & Deployment](#-build--deployment)
- [Troubleshooting](#-troubleshooting)
- [Documentation](#-documentation)

</div>

---

## 🎯 What is This?

**Android Kotlin Template** is a **Vite-style project generator** for Android applications - just like `create-react-app`, `create-next-app`, or `create-vite`, but specifically designed for Android!

This repository provides:

1. **📦 Complete Template** - Production-ready Android Kotlin project with all essential features
2. **🛠️ Smart Generator** - Automated tool to create new projects from this template
3. **🚀 Intelligent Setup** - Automated script that handles SDK installation, emulator setup, and device deployment
4. **🎨 Modern UI** - Material Design 3 with dark theme support and adaptive icons
5. **📱 Best Practices** - Industry-standard architecture and code organization

### Why Choose This Template?

✅ **Zero Configuration** - Start coding immediately  
✅ **Modern Architecture** - ViewBinding, SharedPreferences  
✅ **Production Ready** - Splash screen, dark theme, network checker  
✅ **Smart Deployment** - Automated emulator or physical device installation  
✅ **Beautiful Icon** - Adaptive launcher icon with Kotlin branding  
✅ **Well Documented** - Comprehensive guides and comments  

---

## ⚡ Quick Start

### Method 1: One-Line Install (Recommended)

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/satyam16-ai/android-kotlin-template/main/create-android-app.sh)
```

### Method 2: Clone and Use as Template

```bash
# Clone this repository
git clone https://github.com/satyam16-ai/android-kotlin-template.git MyAwesomeApp
cd MyAwesomeApp

# Build and run
./setup.sh
```

### Method 3: Global Install

```bash
sudo curl -fsSL https://raw.githubusercontent.com/satyam16-ai/android-kotlin-template/main/create-android-app.sh \
  -o /usr/local/bin/create-android-app
sudo chmod +x /usr/local/bin/create-android-app

# Now use anywhere
create-android-app
```

---

## ✨ Features

### 🎨 App Features
- ✅ **Animated Splash Screen** - Professional 2.5s scale/fade animation
- ✅ **Share App Functionality** - Built-in app sharing via Intent
- ✅ **SharedPreferences** - Theme persistence & settings storage
- ✅ **Snackbar Notifications** - Success/error user feedback
- ✅ **App Info Dialog** - Version, author, and license information
- ✅ **Network Status Checker** - Real-time connectivity detection
- ✅ **Dark Theme Support** - Theme toggle with persistence
- ✅ **Material Design 3** - Modern UI components
- ✅ **ViewBinding** - Type-safe view access

### 🛠️ Development Features
- ✅ **Kotlin Native** - 100% Kotlin
- ✅ **Gradle 8.12** - Latest build system
- ✅ **Android SDK 34** - Target latest Android (Min SDK 21)
- ✅ **Enhanced Setup Script** - 3-option deployment system:
  - 📱 Physical device detection & installation
  - 🖥️ **Emulator auto-installation & creation**
  - ⏭️ Skip installation option
- ✅ **Production Ready** - Best practices included

> 📖 **New!** Check [SETUP_FEATURES.md](SETUP_FEATURES.md) for complete setup script documentation

---

## 📦 What's Inside

```
android-kotlin-template/
├── create-android-app.sh         # Project generator
├── setup.sh                       # Automated setup
├── app/                           # Android application
│   ├── src/main/
│   │   ├── java/.../
│   │   │   ├── SplashActivity.kt
│   │   │   └── MainActivity.kt
│   │   └── res/                   # Resources
│   └── build.gradle
├── gradle/                        # Gradle wrapper
└── build.gradle
```

---

## 🎬 Usage

### Generate New Project

```bash
```

---

## 📦 Complete Installation Guide

### Step-by-Step Installation

#### Step 1: Clone or Download

```bash
git clone https://github.com/satyam16-ai/android-kotlin-template.git MyApp
cd MyApp
```

#### Step 2: Make Setup Script Executable

```bash
chmod +x setup.sh
```

#### Step 3: Run Setup Script

```bash
./setup.sh
```

#### Step 4: Follow Interactive Menu

The script will:
- Check Java installation
- Verify Android SDK
- Detect connected devices
- Show 3 deployment options:
  1. **Physical Device** - Install on connected phone/tablet
  2. **Android Emulator** - Create and use emulator (auto-installs if needed)
  3. **Skip Installation** - Build APK only

#### Step 5: Wait for Build

```
🏗️  Building APK...
BUILD SUCCESSFUL in 6s
✓ APK built successfully
```

#### Step 6: App Installed!

Check your device for the app with Kotlin "K" icon.

---

## 🚀 Automated Setup Script

The `setup.sh` script provides intelligent automation:

### Features

1. **Environment Detection**
   - Auto-detects Java (JDK 8+)
   - Finds Android SDK automatically
   - Validates required components

2. **Device Detection**
   - Scans for physical devices via ADB
   - Lists available emulators
   - Shows device model and Android version

3. **Emulator Auto-Installation** ⭐ NEW!
   - Downloads Command-line Tools if needed
   - Installs Emulator package (~150MB)
   - Downloads System Image (~800MB)
   - Creates AVD automatically
   - Real-time progress with spinner

4. **Smart Installation**
   - Builds APK automatically
   - Installs on selected device
   - Launches app after installation

### Usage Examples

**Install on Phone:**
```bash
./setup.sh  # Select option 1
```

**Create Emulator:**
```bash
./setup.sh  # Select option 2 (first time downloads ~950MB)
```

**Build Only:**
```bash
./setup.sh  # Select option 3
# APK at: app/build/outputs/apk/debug/app-debug.apk
```

> 📖 See [SETUP_FEATURES.md](SETUP_FEATURES.md) for complete documentation

---

## 🎨 App Features Explained

### 1. Animated Splash Screen
**File:** `SplashActivity.kt`

Professional 2.5s animation with:
- Scale effect (0.5x → 1.0x)
- Fade effect (invisible → visible)
- Auto-transition to MainActivity

```kotlin
// Customize duration:
postDelayed({ /* ... */ }, 2500) // milliseconds
```

### 2. Custom Launcher Icon
**Files:** `res/mipmap-*/`, `res/drawable/ic_launcher_*`

Features:
- Adaptive icon (Android 8.0+)
- Kotlin "K" logo design
- Purple gradient background
- All densities (mdpi to xxxhdpi)
- Round variants included

**Customize:** Replace PNG files or edit vector drawables

### 3. Dark Theme Support
**Files:** `res/values-night/colors.xml`, `MainActivity.kt`

- Toggle button in app
- Saves preference automatically
- Persists across restarts
- Material Design 3 colors

### 4. Share App
**File:** `MainActivity.kt` → `shareApp()`

- Built-in Android share Intent
- Shares app name + Play Store link
- Opens system share sheet

### 5. App Info Dialog
**File:** `MainActivity.kt` → `showAppInfoDialog()`

Shows:
- App version (auto from BuildConfig)
- Author name
- MIT License

### 6. Network Checker
**File:** `MainActivity.kt` → `checkNetworkStatus()`

- Real-time connectivity check
- WiFi + Mobile data detection
- Snackbar notifications (green/red)

### 7. ViewBinding
**All Activities**

Type-safe view access:
```kotlin
// ❌ Old way:
val button = findViewById<Button>(R.id.button)

// ✅ ViewBinding:
binding.button.setOnClickListener { /* ... */ }
```

Benefits: Null safety, compile-time checks, no findViewById!

---

## 📁 Project Structure

```
android-kotlin-template/
│
├── 📄 README.md                   # This file
├── 📄 SETUP_FEATURES.md          # Setup documentation
├── 📄 LICENSE                     # MIT License
│
├── 🔧 setup.sh                    # Automated setup
├── 🔧 create-android-app.sh      # Project generator
│
├── 📁 app/
│   ├── build.gradle               # Dependencies
│   ├── proguard-rules.pro        # ProGuard config
│   │
│   └── src/main/
│       ├── AndroidManifest.xml    # App config
│       │
│       ├── java/com/example/myapplication/
│       │   ├── SplashActivity.kt # Splash screen
│       │   └── MainActivity.kt   # Main app
│       │
│       └── res/
│           ├── drawable/          # Vector icons
│           ├── mipmap-*/          # Launcher icons (all densities)
│           ├── layout/            # XML layouts
│           ├── values/            # Strings, colors (light)
│           └── values-night/      # Dark theme colors
│
├── 📁 gradle/wrapper/
└── 📄 build.gradle                # Root config
```

### Key Files

| File | Purpose |
|------|---------|
| `setup.sh` | Automated build & install |
| `build.gradle` (app) | Dependencies & SDK versions |
| `AndroidManifest.xml` | Permissions & activities |
| `SplashActivity.kt` | Splash screen logic |
| `MainActivity.kt` | All app features |
| `colors.xml` | Theme colors |
| `strings.xml` | All text (localization-ready) |

---

## 🎨 Customization Guide

### 1. Change App Name

**File:** `app/src/main/res/values/strings.xml`
```xml
<string name="app_name">My Awesome App</string>
```

### 2. Change Package Name

**Using Command Line:**
```bash
find . -type f \( -name "*.kt" -o -name "*.xml" -o -name "*.gradle" \) \
  -exec sed -i 's/com\.example\.myapplication/com.yourcompany.app/g' {} +
```

**Using Android Studio:**
1. Right-click package → Refactor → Rename
2. Enter new package name
3. Click Refactor

### 3. Customize Colors

**Light Theme:** `app/src/main/res/values/colors.xml`
```xml
<color name="purple_500">#YOUR_COLOR</color>
```

**Dark Theme:** `app/src/main/res/values-night/colors.xml`
```xml
<color name="purple_200">#YOUR_DARK_COLOR</color>
```

### 4. Change Icon

**Method 1: Replace PNGs**
Replace files in `res/mipmap-mdpi/`, `mipmap-hdpi/`, etc.

**Method 2: Android Studio**
1. Right-click `res` → New → Image Asset
2. Icon Type: Launcher Icons
3. Upload your image
4. Finish

**Method 3: Edit Vectors**
Edit `drawable/ic_launcher_background.xml` and `ic_launcher_foreground_new.xml`

### 5. Add Dependencies

**File:** `app/build.gradle`
```gradle
dependencies {
    // Add Retrofit for networking
    implementation 'com.squareup.retrofit2:retrofit:2.9.0'
    
    // Add Room for database
    implementation 'androidx.room:room-runtime:2.6.0'
    kapt 'androidx.room:room-compiler:2.6.0'
}
```

Then: `./gradlew sync`

### 6. Update Version

**File:** `app/build.gradle`
```gradle
android {
    defaultConfig {
        versionCode 2      // Integer (increment each release)
        versionName "1.1"  // String (shown to users)
    }
}
```

---

## 🏗️ Build & Deployment

### Development Build

```bash
# Build debug APK
./gradlew assembleDebug

# Build and install
./gradlew installDebug

# Or use setup script
./setup.sh
```

**APK Location:** `app/build/outputs/apk/debug/app-debug.apk`

### Production Build

**Step 1: Generate Keystore**
```bash
keytool -genkey -v -keystore release-key.jks \
  -keyalg RSA -keysize 2048 -validity 10000 \
  -alias my-app-key
```

**Step 2: Configure Signing**

Create `keystore.properties` in root:
```properties
storePassword=YOUR_PASSWORD
keyPassword=YOUR_KEY_PASSWORD
keyAlias=my-app-key
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

**Step 4: Build Release**
```bash
./gradlew assembleRelease
```

**Release APK:** `app/build/outputs/apk/release/app-release.apk`

### App Bundle (Play Store)

```bash
./gradlew bundleRelease
```

**Bundle:** `app/build/outputs/bundle/release/app-release.aab`

---

## 🐛 Troubleshooting

### Build Errors

**Problem:** Gradle sync failed
```bash
# Solution:
./gradlew clean
./gradlew build --refresh-dependencies
```

**Problem:** OutOfMemoryError
```bash
# Solution: Edit gradle.properties
org.gradle.jvmargs=-Xmx4096m
```

### Device Not Detected

```bash
# Check devices
adb devices

# Restart ADB
adb kill-server && adb start-server
```

**On Device:**
1. Enable Developer Options (tap Build Number 7x)
2. Enable USB Debugging
3. Enable "Install via USB" (Xiaomi/MIUI)

### Emulator Issues

**Problem:** Emulator won't start
```bash
# Check if emulator is installed
emulator -list-avds

# Start manually
emulator -avd AndroidKotlinTemplate
```

**Problem:** Emulator is slow
```bash
# Enable KVM (Linux)
sudo apt install qemu-kvm
kvm-ok  # Should say "KVM acceleration can be used"
```

### App Crashes

```bash
# View crash logs
adb logcat | grep -i exception

# Or filter by your app
adb logcat | grep "com.example.myapplication"
```

### Common Errors

| Error | Solution |
|-------|----------|
| `JAVA_HOME not set` | Export JAVA_HOME in ~/.bashrc |
| `SDK location not found` | Run setup.sh or set ANDROID_HOME |
| `Device unauthorized` | Check device for USB debugging prompt |
| `INSTALL_FAILED_INSUFFICIENT_STORAGE` | Free up space on device |

---

## 📚 Documentation

### Official Resources
- [Kotlin Documentation](https://kotlinlang.org/docs/home.html)
- [Android Developer Guides](https://developer.android.com/guide)
- [Material Design 3](https://m3.material.io/)

### Project Documentation
- [CHANGELOG.md](CHANGELOG.md) - Version history
- [CONTRIBUTING.md](CONTRIBUTING.md) - Contribution guidelines
- [SECURITY.md](SECURITY.md) - Security policy
- [SETUP_FEATURES.md](SETUP_FEATURES.md) - Setup documentation
- [LICENSE](LICENSE) - MIT License

---

## 📊 Stats

- **Build Time:** ~6 seconds (debug), ~15 seconds (release)
- **APK Size:** ~5.3 MB (debug), ~3.2 MB (release with ProGuard)
- **Min SDK:** API 21 (Android 5.0 Lollipop)
- **Target SDK:** API 34 (Android 14)
- **Device Coverage:** 95%+ of active Android devices
- **Code Quality:** 100% Kotlin, ViewBinding, Material Design 3

---

## 🗺️ Roadmap

### ✅ Completed
- [x] Animated splash screens
- [x] Custom adaptive launcher icon
- [x] Material Design 3 theming
- [x] Dark theme with persistence
- [x] ViewBinding integration
- [x] Automated setup with emulator support
- [x] Network status checker
- [x] Share functionality
- [x] App info dialog

### 🔮 Planned
- [ ] Jetpack Compose examples
- [ ] MVVM architecture template
- [ ] Room database boilerplate
- [ ] Retrofit + Repository pattern
- [ ] Navigation component
- [ ] Unit test templates
- [ ] Hilt dependency injection
- [ ] Firebase integration
- [ ] CI/CD examples (GitHub Actions)

---

## 👨‍💻 Author

**Satyam**
- GitHub: [@satyam16-ai](https://github.com/satyam16-ai)
- Repository: [android-kotlin-template](https://github.com/satyam16-ai/android-kotlin-template)

---

## 📜 License

MIT License - see [LICENSE](LICENSE) file

---

## 🤝 Contributing

Contributions welcome! Here's how:

1. **Fork** the repository
2. **Create** a feature branch (`git checkout -b feature/AmazingFeature`)
3. **Commit** changes (`git commit -m 'Add AmazingFeature'`)
4. **Push** to branch (`git push origin feature/AmazingFeature`)
5. **Open** a Pull Request

See [CONTRIBUTING.md](CONTRIBUTING.md) for detailed guidelines.

---

## ⭐ Show Your Support

If this helped you:

- ⭐ **Star** this repository
- 🍴 **Fork** for your projects
- 📢 **Share** with other developers
- 🐛 **Report** issues you find
- 💡 **Suggest** new features

---

<div align="center">

## 🚀 Ready to Build?

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/satyam16-ai/android-kotlin-template/main/create-android-app.sh)
```

**Made with ❤️ for Android developers by Satyam**

[⬆️ Back to Top](#-android-kotlin-template)

---

[![GitHub stars](https://img.shields.io/github/stars/satyam16-ai/android-kotlin-template?style=social)](https://github.com/satyam16-ai/android-kotlin-template/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/satyam16-ai/android-kotlin-template?style=social)](https://github.com/satyam16-ai/android-kotlin-template/network/members)
[![GitHub issues](https://img.shields.io/github/issues/satyam16-ai/android-kotlin-template)](https://github.com/satyam16-ai/android-kotlin-template/issues)

[Report Bug](https://github.com/satyam16-ai/android-kotlin-template/issues) • [Request Feature](https://github.com/satyam16-ai/android-kotlin-template/issues)

</div>

````

```

### Build & Install

```bash
cd MyApp
./setup.sh  # Automated build & install
```

---

## 🔧 Requirements

- **Java JDK** 8+ (tested with Java 25)
- **Android SDK** (auto-installed)
- **Gradle** 8.12+ (included)
- **Git** (for cloning)

**Target Devices:**
- Min SDK: Android 5.0 (API 21)
- Target SDK: Android 14 (API 34)

---

## 📱 Manual Build

```bash
# Build APK
./gradlew assembleDebug

# Install on device
./gradlew installDebug

# Clean build
./gradlew clean
```

**APK Location:** `app/build/outputs/apk/debug/app-debug.apk`

---

## 🎨 Customization

### Change Package Name

```bash
find . -type f \( -name "*.kt" -o -name "*.xml" -o -name "*.gradle" \) \
  -exec sed -i 's/com\.example\.myapplication/com.your.package/g' {} +
```

### Update App Name

Edit `app/src/main/res/values/strings.xml`:
```xml
<string name="app_name">Your App</string>
```

---

## 🐛 Troubleshooting

### Build Failures
```bash
./gradlew clean build
```

### Device Not Detected
```bash
adb devices
adb kill-server && adb start-server
```

### Installation Failed
- Enable **USB Debugging**
- Enable **Install via USB** (Xiaomi)
- Check storage space

---

## 📚 Documentation

- [Security Policy](SECURITY.md)
- [Contributing](CONTRIBUTING.md)
- [Changelog](CHANGELOG.md)
- [License](LICENSE)

---

## 🚀 Deployment

```bash
# Build release
./gradlew assembleRelease

# Sign APK
keytool -genkey -v -keystore release-key.jks \
  -keyalg RSA -keysize 2048 -validity 10000
```

---

## 📊 Stats

- **Build Time:** ~6 seconds
- **APK Size:** ~5.3MB
- **Supported Devices:** 95%+ of Android devices

---

## 🎯 Roadmap

- [x] Animated splash screens
- [x] Material Design 3
- [x] Automated setup script
- [ ] Jetpack Compose support
- [ ] ViewBinding support
- [ ] Dark theme
- [ ] Firebase templates
- [ ] Room database boilerplate
- [ ] Navigation component
- [ ] Retrofit networking setup
- [ ] Unit test templates
- [ ] MVVM architecture

---

## �‍💻 Author

**Satyam**
- GitHub: [@satyam16-ai](https://github.com/satyam16-ai)
- Repository: [android-kotlin-template](https://github.com/satyam16-ai/android-kotlin-template)

---

## �📜 License

MIT License - see [LICENSE](LICENSE) file

---

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!  
Feel free to check [issues page](https://github.com/satyam16-ai/android-kotlin-template/issues).

---

## ⭐ Show Your Support

Give a ⭐ if this project helped you!

---

<div align="center">

**Made with ❤️ for Android developers by Satyam**

[Report Bug](https://github.com/satyam16-ai/android-kotlin-template/issues) • [Request Feature](https://github.com/satyam16-ai/android-kotlin-template/issues) • [Discussions](https://github.com/satyam16-ai/android-kotlin-template/discussions)

</div>
