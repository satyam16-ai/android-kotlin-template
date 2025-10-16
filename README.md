# 🚀 Android Kotlin Template

<div align="center">

[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Kotlin](https://img.shields.io/badge/Kotlin-1.9.0-purple.svg)](https://kotlinlang.org/)
[![Android](https://img.shields.io/badge/Android-SDK%2034-green.svg)](https://developer.android.com/)
[![Gradle](https://img.shields.io/badge/Gradle-8.12-blue.svg)](https://gradle.org/)

**Professional Android Kotlin project generator with Vite-style workflow**

Generate production-ready Android apps with animated splash screens in seconds!

[Quick Start](#-quick-start) • [Features](#-features) • [Documentation](#-documentation)

</div>

---

## 🎯 What is This?

A **Vite-style project generator** for Android Kotlin applications - just like `create-react-app` or `create-next-app`, but for Android! This repository serves dual purposes:

1. **📦 Template Repository** - Complete Android Kotlin project template
2. **🛠️ Generator Script** - Tool to create new projects from this template

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

- ✅ **Animated Splash Screen** - Professional 2.5s scale/fade animation
- ✅ **Material Design 3** - Modern UI components
- ✅ **Kotlin Native** - 100% Kotlin
- ✅ **Gradle 8.12** - Latest build system
- ✅ **Android SDK 34** - Target latest Android
- ✅ **Automated Setup** - One-command build & install
- ✅ **Production Ready** - Best practices included

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
./create-android-app.sh

# Enter details:
# Project name: MyApp
# Package name: com.example.myapp
# App display name: My App
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
