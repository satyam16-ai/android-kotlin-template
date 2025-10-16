package com.example.myapplication

import android.content.Intent
import android.net.Uri
import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import androidx.appcompat.app.AppCompatDelegate
import com.example.myapplication.databinding.ActivityMainBinding

/**
 * Main Activity with ViewBinding & Personal Branding
 * Author: Satyam Tiwari (@satyam16-ai)
 * Email: satyamkumar16.ai@gmail.com
 * GitHub: https://github.com/satyam16-ai
 */
class MainActivity : AppCompatActivity() {
    
    private lateinit var binding: ActivityMainBinding
    
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)
        
        setupUI()
        setupClickListeners()
    }
    
    private fun setupUI() {
        // Set personal branding information
        binding.developerName.text = "Developed by Satyam Tiwari"
        binding.versionText.text = "Version 1.0.0"
        
        // Check current theme and set button text accordingly
        val currentMode = AppCompatDelegate.getDefaultNightMode()
        binding.themeToggleButton.text = if (currentMode == AppCompatDelegate.MODE_NIGHT_YES) {
            "☀️ Light Mode"
        } else {
            "🌙 Dark Mode"
        }
    }
    
    private fun setupClickListeners() {
        // GitHub button - opens your GitHub profile
        binding.githubButton.setOnClickListener {
            openUrl("https://github.com/satyam16-ai")
        }
        
        // Theme toggle button - switches between light/dark mode
        binding.themeToggleButton.setOnClickListener {
            toggleTheme()
        }
        
        // View source button - opens this project repository
        binding.viewSourceButton.setOnClickListener {
            openUrl("https://github.com/satyam16-ai/android-kotlin-template")
        }
        
        // Email button - sends email to your address
        binding.emailButton.setOnClickListener {
            sendEmail()
        }
    }
    
    private fun toggleTheme() {
        val currentMode = AppCompatDelegate.getDefaultNightMode()
        if (currentMode == AppCompatDelegate.MODE_NIGHT_YES) {
            AppCompatDelegate.setDefaultNightMode(AppCompatDelegate.MODE_NIGHT_NO)
            binding.themeToggleButton.text = "🌙 Dark Mode"
        } else {
            AppCompatDelegate.setDefaultNightMode(AppCompatDelegate.MODE_NIGHT_YES)
            binding.themeToggleButton.text = "☀️ Light Mode"
        }
    }
    
    private fun openUrl(url: String) {
        try {
            val intent = Intent(Intent.ACTION_VIEW, Uri.parse(url))
            startActivity(intent)
        } catch (e: Exception) {
            e.printStackTrace()
        }
    }
    
    private fun sendEmail() {
        try {
            val intent = Intent(Intent.ACTION_SENDTO).apply {
                data = Uri.parse("mailto:satyamtiwariworks@gmail.com")
                putExtra(Intent.EXTRA_SUBJECT, "Hello from ${getString(R.string.app_name)}")
                putExtra(Intent.EXTRA_TEXT, "Hi Satyam,\n\n")
            }
            startActivity(intent)
        } catch (e: Exception) {
            e.printStackTrace()
        }
    }
    
    override fun onDestroy() {
        super.onDestroy()
        // ViewBinding cleanup if needed
    }
}
