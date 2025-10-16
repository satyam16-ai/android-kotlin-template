package com.example.myapplication

import android.content.Context
import android.content.Intent
import android.content.SharedPreferences
import android.net.ConnectivityManager
import android.net.NetworkCapabilities
import android.net.Uri
import android.os.Build
import android.os.Bundle
import androidx.appcompat.app.AlertDialog
import androidx.appcompat.app.AppCompatActivity
import androidx.appcompat.app.AppCompatDelegate
import com.example.myapplication.databinding.ActivityMainBinding
import com.google.android.material.snackbar.Snackbar

/**
 * Main Activity with Enhanced Features
 * 
 * Features Implemented:
 * 1. 📱 Share App Feature - Easy viral growth
 * 2. 💾 SharedPreferences - Save user preferences
 * 3. 🔔 Snackbar Messages - Better UX feedback
 * 4. 📊 App Info Dialog - Professional touch
 * 5. 🌐 Network Status Checker - Better error handling
 * 
 * Author: Satyam Tiwari (@satyam16-ai)
 * Email: satyamtiwariworks@gmail.com
 * GitHub: https://github.com/satyam16-ai
 */
class MainActivity : AppCompatActivity() {
    
    private lateinit var binding: ActivityMainBinding
    private lateinit var preferences: SharedPreferences
    
    companion object {
        private const val PREFS_NAME = "AppPreferences"
        private const val KEY_DARK_MODE = "isDarkMode"
    }
    
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        
        // Initialize SharedPreferences
        preferences = getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
        
        // Load saved theme preference BEFORE setting content view
        loadThemePreference()
        
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)
        
        setupUI()
        setupClickListeners()
    }
    
    // ============================================
    // 🎨 UI SETUP
    // ============================================
    
    private fun setupUI() {
        binding.developerName.text = "Developed by Satyam Tiwari"
        binding.versionText.text = "Version 1.0.0"
        
        updateThemeButtonText()
    }
    
    private fun updateThemeButtonText() {
        val isDarkMode = preferences.getBoolean(KEY_DARK_MODE, false)
        binding.themeToggleButton.text = if (isDarkMode) {
            "☀️ Light Mode"
        } else {
            "🌙 Dark Mode"
        }
    }
    
    // ============================================
    // 🖱️ CLICK LISTENERS
    // ============================================
    
    private fun setupClickListeners() {
        // GitHub button - opens your GitHub profile
        binding.githubButton.setOnClickListener {
            if (isNetworkAvailable()) {
                openUrl("https://github.com/satyam16-ai")
                showSuccessSnackbar(getString(R.string.opening_github))
            } else {
                showErrorSnackbar(getString(R.string.no_internet))
            }
        }
        
        // Email button - sends email to your address
        binding.emailButton.setOnClickListener {
            sendEmail()
            showSuccessSnackbar(getString(R.string.email_sent))
        }
        
        // View source button - opens this project repository
        binding.viewSourceButton.setOnClickListener {
            if (isNetworkAvailable()) {
                openUrl("https://github.com/satyam16-ai/android-kotlin-template")
                showSuccessSnackbar(getString(R.string.opening_source))
            } else {
                showErrorSnackbar(getString(R.string.no_internet))
            }
        }
        
        // Share button - shares app with others
        binding.shareButton.setOnClickListener {
            shareApp()
        }
        
        // App Info button - shows app information dialog
        binding.appInfoButton.setOnClickListener {
            showAppInfoDialog()
        }
        
        // Theme toggle button - switches between light/dark mode
        binding.themeToggleButton.setOnClickListener {
            toggleTheme()
        }
    }
    
    // ============================================
    // FEATURE 1: 📱 SHARE APP
    // ============================================
    
    private fun shareApp() {
        try {
            val shareIntent = Intent(Intent.ACTION_SEND).apply {
                type = "text/plain"
                putExtra(Intent.EXTRA_SUBJECT, getString(R.string.share_app_title))
                putExtra(Intent.EXTRA_TEXT, getString(R.string.share_app_message))
            }
            startActivity(Intent.createChooser(shareIntent, "Share via"))
            showSuccessSnackbar(getString(R.string.share_thanks))
        } catch (e: Exception) {
            showErrorSnackbar("Unable to share app")
            e.printStackTrace()
        }
    }
    
    // ============================================
    // FEATURE 2: 💾 SHARED PREFERENCES
    // ============================================
    
    private fun loadThemePreference() {
        val isDarkMode = preferences.getBoolean(KEY_DARK_MODE, false)
        if (isDarkMode) {
            AppCompatDelegate.setDefaultNightMode(AppCompatDelegate.MODE_NIGHT_YES)
        } else {
            AppCompatDelegate.setDefaultNightMode(AppCompatDelegate.MODE_NIGHT_NO)
        }
    }
    
    private fun saveThemePreference(isDarkMode: Boolean) {
        preferences.edit().apply {
            putBoolean(KEY_DARK_MODE, isDarkMode)
            apply()
        }
        showSuccessSnackbar(getString(R.string.preferences_saved))
    }
    
    // ============================================
    // FEATURE 3: 🔔 SNACKBAR MESSAGES
    // ============================================
    
    private fun showSuccessSnackbar(message: String) {
        Snackbar.make(binding.root, message, Snackbar.LENGTH_SHORT)
            .setAction("OK") { }
            .setBackgroundTint(getColor(R.color.teal_200))
            .setTextColor(getColor(android.R.color.white))
            .setActionTextColor(getColor(android.R.color.white))
            .show()
    }
    
    private fun showErrorSnackbar(message: String) {
        Snackbar.make(binding.root, message, Snackbar.LENGTH_LONG)
            .setAction("RETRY") { 
                // Retry action can be customized
            }
            .setBackgroundTint(getColor(com.google.android.material.R.color.design_default_color_error))
            .setTextColor(getColor(android.R.color.white))
            .setActionTextColor(getColor(android.R.color.white))
            .show()
    }
    
    // ============================================
    // FEATURE 4: 📊 APP INFO DIALOG
    // ============================================
    
    private fun showAppInfoDialog() {
        AlertDialog.Builder(this)
            .setTitle(getString(R.string.app_info_title))
            .setMessage(getString(R.string.app_info_message))
            .setPositiveButton("🔗 GitHub") { _, _ -> 
                if (isNetworkAvailable()) {
                    openUrl("https://github.com/satyam16-ai")
                    showSuccessSnackbar("Opening GitHub...")
                } else {
                    showErrorSnackbar(getString(R.string.no_internet))
                }
            }
            .setNegativeButton("📧 Email") { _, _ ->
                sendEmail()
            }
            .setNeutralButton("Close", null)
            .show()
    }
    
    // ============================================
    // FEATURE 5: � NETWORK STATUS CHECKER
    // ============================================
    
    private fun isNetworkAvailable(): Boolean {
        val connectivityManager = getSystemService(Context.CONNECTIVITY_SERVICE) as ConnectivityManager
        
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            val network = connectivityManager.activeNetwork ?: return false
            val capabilities = connectivityManager.getNetworkCapabilities(network) ?: return false
            
            return when {
                capabilities.hasTransport(NetworkCapabilities.TRANSPORT_WIFI) -> true
                capabilities.hasTransport(NetworkCapabilities.TRANSPORT_CELLULAR) -> true
                capabilities.hasTransport(NetworkCapabilities.TRANSPORT_ETHERNET) -> true
                else -> false
            }
        } else {
            @Suppress("DEPRECATION")
            val networkInfo = connectivityManager.activeNetworkInfo
            @Suppress("DEPRECATION")
            return networkInfo?.isConnected == true
        }
    }
    
    // ============================================
    // 🛠️ HELPER METHODS
    // ============================================
    
    private fun toggleTheme() {
        val currentDarkMode = preferences.getBoolean(KEY_DARK_MODE, false)
        val newDarkMode = !currentDarkMode
        
        // Save preference
        saveThemePreference(newDarkMode)
        
        // Apply theme
        if (newDarkMode) {
            AppCompatDelegate.setDefaultNightMode(AppCompatDelegate.MODE_NIGHT_YES)
            showSuccessSnackbar(getString(R.string.theme_changed_dark))
        } else {
            AppCompatDelegate.setDefaultNightMode(AppCompatDelegate.MODE_NIGHT_NO)
            showSuccessSnackbar(getString(R.string.theme_changed_light))
        }
        
        updateThemeButtonText()
    }
    
    private fun openUrl(url: String) {
        try {
            val intent = Intent(Intent.ACTION_VIEW, Uri.parse(url))
            startActivity(intent)
        } catch (e: Exception) {
            showErrorSnackbar("Unable to open URL")
            e.printStackTrace()
        }
    }
    
    private fun sendEmail() {
        try {
            val intent = Intent(Intent.ACTION_SENDTO).apply {
                data = Uri.parse("mailto:satyamtiwariworks@gmail.com")
                putExtra(Intent.EXTRA_SUBJECT, "Hello from ${getString(R.string.app_name)}")
                putExtra(Intent.EXTRA_TEXT, "Hi Satyam,\n\nI found your Android Kotlin Template amazing!\n\n")
            }
            startActivity(Intent.createChooser(intent, "Send Email"))
        } catch (e: Exception) {
            showErrorSnackbar("Unable to open email app")
            e.printStackTrace()
        }
    }
    
    override fun onDestroy() {
        super.onDestroy()
        // ViewBinding cleanup if needed
    }
}
