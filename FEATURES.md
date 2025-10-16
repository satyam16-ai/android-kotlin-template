# 🎨 Features Documentation

This document describes all the features available in the Android Kotlin Template.

**Author:** Satyam ([@satyam16-ai](https://github.com/satyam16-ai))

---

## 📱 Core Features

### 1. Multiple Splash Screen Animations

The template includes **7 different splash screen animations** that you can easily switch between:

#### Available Animation Types:

1. **SCALE_FADE** (Default) - Smooth scale and fade-in effect
2. **BOUNCE** - Playful bounce entrance
3. **SLIDE_LEFT** - Slide from left side
4. **ROTATE_FADE** - Rotation with fade effect
5. **ZOOM_OUT** - Starts large and zooms to normal size
6. **FADE_IN** - Simple elegant fade-in
7. **COMBINED** - Complex animation combining rotation, scale, and fade

#### How to Change Animation:

Edit `SplashActivity.kt` and change the animation type:

```kotlin
private val animationType = SplashAnimations.AnimationType.BOUNCE
```

#### Custom Animation:

You can create your own animations by adding methods to `SplashAnimations.kt`:

```kotlin
fun myCustomAnimation(logo: View, appName: View, onComplete: () -> Unit) {
    // Your animation code here
}
```

---

### 2. Dark Theme Support 🌙

Full Material Design dark theme implementation with automatic system theme detection.

#### Features:
- Automatic theme switching based on system settings
- Custom dark color palette
- Optimized for OLED displays
- Consistent across all screens

#### Theme Colors:

**Light Theme:**
- Primary: Purple 500 (#6200EE)
- Background: White (#FFFFFF)
- Text: Black (#000000)

**Dark Theme:**
- Primary: Purple 200 (#BB86FC)
- Background: Dark Gray (#121212)
- Text: Light Gray (#E1E1E1)

#### Files:
- `values/colors.xml` - Light theme colors
- `values-night/colors.xml` - Dark theme colors
- `values/styles.xml` - Light theme styles
- `values-night/styles.xml` - Dark theme styles

---

### 3. ViewBinding Support 🔗

Modern ViewBinding is enabled and implemented throughout the template.

#### Benefits:
- Null safety
- Type safety
- No more `findViewById()`
- Better performance than Data Binding
- Compile-time safety

#### Usage Example:

```kotlin
class MainActivity : AppCompatActivity() {
    private lateinit var binding: ActivityMainBinding
    
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)
        
        // Access views directly
        binding.textView.text = "Hello!"
    }
}
```

#### Enable/Disable:

ViewBinding is enabled in `app/build.gradle`:

```gradle
buildFeatures {
    viewBinding true
}
```

---

### 4. Networking Setup (Optional) 🌐

Pre-configured Retrofit and OkHttp setup for API calls.

#### Included (Commented Out):
- Retrofit 2.9.0
- OkHttp 4.11.0
- Gson Converter
- Logging Interceptor
- Coroutines support

#### To Enable:

1. Uncomment dependencies in `app/build.gradle`:
```gradle
implementation 'com.squareup.retrofit2:retrofit:2.9.0'
implementation 'com.squareup.retrofit2:converter-gson:2.9.0'
implementation 'com.squareup.okhttp3:okhttp:4.11.0'
implementation 'com.squareup.okhttp3:logging-interceptor:4.11.0'
implementation 'org.jetbrains.kotlinx:kotlinx-coroutines-android:1.7.3'
```

2. Sync Gradle

3. Uncomment code in:
   - `network/ApiService.kt`
   - `network/RetrofitClient.kt`

#### Example Usage:

```kotlin
// In Activity or ViewModel
private fun fetchData() {
    CoroutineScope(Dispatchers.IO).launch {
        try {
            val data = RetrofitClient.apiService.getData()
            withContext(Dispatchers.Main) {
                // Update UI
            }
        } catch (e: Exception) {
            // Handle error
        }
    }
}
```

#### Add Internet Permission:

Add to `AndroidManifest.xml`:
```xml
<uses-permission android:name="android.permission.INTERNET" />
```

---

## 🎨 Material Design 3

Full Material Design 3 implementation with:
- Material Components 1.9.0
- Modern UI guidelines
- Elevation and shadows
- Ripple effects
- Custom color schemes

---

## 🏗️ Project Structure

```
app/
├── animations/
│   └── SplashAnimations.kt       # Animation library
├── network/
│   ├── ApiService.kt              # API endpoints (optional)
│   └── RetrofitClient.kt          # HTTP client setup (optional)
├── MainActivity.kt                # Main screen
└── SplashActivity.kt              # Splash screen

res/
├── layout/
│   ├── activity_main.xml          # Main layout
│   └── activity_splash.xml        # Splash layout
├── values/
│   ├── colors.xml                 # Light theme colors
│   ├── strings.xml                # Text resources
│   └── styles.xml                 # Light theme styles
└── values-night/
    ├── colors.xml                 # Dark theme colors
    └── styles.xml                 # Dark theme styles
```

---

## 🚀 Quick Start Guide

### 1. Create New Project

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/satyam16-ai/android-kotlin-template/main/create-android-app.sh)
```

Or download script:
```bash
curl -fsSL https://raw.githubusercontent.com/satyam16-ai/android-kotlin-template/main/create-android-app.sh -o create-android-app.sh
bash create-android-app.sh
```

### 2. Customize

- Change app name in `res/values/strings.xml`
- Update package name in files and gradle
- Choose your splash animation
- Enable features you need (networking, etc.)

### 3. Build & Run

```bash
./setup.sh
```

Or manually:
```bash
./gradlew assembleDebug
./gradlew installDebug
```

---

## 🎯 Customization Guide

### Change App Icon

1. Place your icon in `res/drawable/ic_launcher_foreground.xml`
2. Or use Image Asset Studio in Android Studio

### Change Colors

Edit `res/values/colors.xml`:
```xml
<color name="purple_500">#YOUR_COLOR</color>
```

### Change App Name

Edit `res/values/strings.xml`:
```xml
<string name="app_name">Your App Name</string>
```

### Change Package Name

Use refactor tool or run:
```bash
find . -type f \( -name "*.kt" -o -name "*.xml" -o -name "*.gradle" \) \
  -exec sed -i 's/com\.example\.myapplication/your.package.name/g' {} +
```

---

## 📚 Best Practices

### 1. Use ViewBinding
Always use ViewBinding instead of findViewById for better performance and safety.

### 2. Handle Lifecycle
Properly handle Android lifecycle in activities and fragments.

### 3. Use Coroutines
For async operations, use Kotlin Coroutines instead of callbacks.

### 4. Follow Material Design
Stick to Material Design guidelines for consistent UX.

### 5. Add Permissions
Only request permissions you actually need.

---

## 🔧 Advanced Features

### Add Navigation Component

```gradle
dependencies {
    implementation "androidx.navigation:navigation-fragment-ktx:2.7.4"
    implementation "androidx.navigation:navigation-ui-ktx:2.7.4"
}
```

### Add Room Database

```gradle
dependencies {
    implementation "androidx.room:room-runtime:2.6.0"
    kapt "androidx.room:room-compiler:2.6.0"
    implementation "androidx.room:room-ktx:2.6.0"
}
```

### Add Dependency Injection (Hilt)

```gradle
dependencies {
    implementation "com.google.dagger:hilt-android:2.48"
    kapt "com.google.dagger:hilt-compiler:2.48"
}
```

---

## 🐛 Troubleshooting

### ViewBinding Not Working
- Ensure `buildFeatures { viewBinding true }` is in build.gradle
- Clean and rebuild: `./gradlew clean build`
- Sync Gradle files

### Dark Theme Not Applying
- Check if system dark mode is enabled
- Verify `values-night` folder exists
- Rebuild project

### Animations Not Smooth
- Test on actual device (not emulator)
- Check device animator settings
- Reduce animation duration

---

## 📖 Resources

- [Kotlin Documentation](https://kotlinlang.org/docs/home.html)
- [Android Developers](https://developer.android.com/)
- [Material Design](https://material.io/)
- [ViewBinding Guide](https://developer.android.com/topic/libraries/view-binding)
- [Retrofit Documentation](https://square.github.io/retrofit/)

---

## 🤝 Contributing

Want to add more features? Check [CONTRIBUTING.md](CONTRIBUTING.md)

---

## 📝 License

MIT License - see [LICENSE](LICENSE)

---

## 👨‍💻 Author

**Satyam**
- GitHub: [@satyam16-ai](https://github.com/satyam16-ai)
- Project: [android-kotlin-template](https://github.com/satyam16-ai/android-kotlin-template)

---

**Made with ❤️ for Android developers**
