package com.example.myapplication

import android.animation.Animator
import android.animation.AnimatorListenerAdapter
import android.animation.ObjectAnimator
import android.content.Intent
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.view.View
import android.view.animation.AccelerateDecelerateInterpolator
import android.widget.ImageView
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import androidx.core.animation.doOnEnd
import com.example.myapplication.animations.SplashAnimations
import com.example.myapplication.databinding.ActivitySplashBinding

/**
 * Splash Activity with multiple animation options and ViewBinding
 * Author: Satyam (@satyam16-ai)
 * 
 * Available animations:
 * - SCALE_FADE (default)
 * - BOUNCE
 * - SLIDE_LEFT
 * - ROTATE_FADE
 * - ZOOM_OUT
 * - FADE_IN
 * - COMBINED
 */
class SplashActivity : AppCompatActivity() {
    
    private lateinit var binding: ActivitySplashBinding
    
    // Change this to try different animations
    private val animationType = SplashAnimations.AnimationType.SCALE_FADE
    
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        
        // Initialize ViewBinding
        binding = ActivitySplashBinding.inflate(layoutInflater)
        setContentView(binding.root)
        
        // Start animations
        animateSplash()
    }
    
    private fun animateSplash() {
        // Apply the selected animation using ViewBinding
        SplashAnimations.applyAnimation(
            type = animationType,
            logo = binding.logoImageview,
            appName = binding.appNameTextview,
            onComplete = {
                // Navigate to MainActivity after animation completes
                Handler(Looper.getMainLooper()).postDelayed({
                    val intent = Intent(this, MainActivity::class.java)
                    startActivity(intent)
                    overridePendingTransition(android.R.anim.fade_in, android.R.anim.fade_out)
                    finish()
                }, 800)
            }
        )
    }
}
