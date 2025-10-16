package com.example.myapplication.animations

import android.animation.AnimatorSet
import android.animation.ObjectAnimator
import android.view.View
import android.view.animation.AccelerateDecelerateInterpolator
import android.view.animation.BounceInterpolator
import android.view.animation.OvershootInterpolator

/**
 * Collection of different splash screen animations
 * Author: Satyam (@satyam16-ai)
 */
object SplashAnimations {

    /**
     * Scale and fade animation (default)
     */
    fun scaleAndFade(logo: View, appName: View, onComplete: () -> Unit) {
        // Initial state
        logo.apply {
            scaleX = 0.5f
            scaleY = 0.5f
            alpha = 0f
        }
        appName.apply {
            alpha = 0f
            translationY = 50f
        }

        // Animate logo
        logo.animate()
            .scaleX(1f)
            .scaleY(1f)
            .alpha(1f)
            .setDuration(800)
            .setInterpolator(AccelerateDecelerateInterpolator())
            .withEndAction {
                // Animate app name
                appName.animate()
                    .alpha(1f)
                    .translationY(0f)
                    .setDuration(600)
                    .setInterpolator(AccelerateDecelerateInterpolator())
                    .withEndAction(onComplete)
                    .start()
            }
            .start()
    }

    /**
     * Bounce animation - playful entrance
     */
    fun bounceIn(logo: View, appName: View, onComplete: () -> Unit) {
        // Initial state
        logo.apply {
            scaleX = 0f
            scaleY = 0f
            alpha = 0f
        }
        appName.apply {
            alpha = 0f
            scaleX = 0f
            scaleY = 0f
        }

        // Animate logo with bounce
        logo.animate()
            .scaleX(1f)
            .scaleY(1f)
            .alpha(1f)
            .setDuration(1000)
            .setInterpolator(BounceInterpolator())
            .withEndAction {
                // Animate app name
                appName.animate()
                    .alpha(1f)
                    .scaleX(1f)
                    .scaleY(1f)
                    .setDuration(500)
                    .setInterpolator(OvershootInterpolator())
                    .withEndAction(onComplete)
                    .start()
            }
            .start()
    }

    /**
     * Slide from left animation
     */
    fun slideFromLeft(logo: View, appName: View, onComplete: () -> Unit) {
        // Initial state
        logo.apply {
            translationX = -1000f
            alpha = 0f
        }
        appName.apply {
            translationX = -1000f
            alpha = 0f
        }

        // Animate logo
        logo.animate()
            .translationX(0f)
            .alpha(1f)
            .setDuration(700)
            .setInterpolator(AccelerateDecelerateInterpolator())
            .withEndAction {
                // Animate app name
                appName.animate()
                    .translationX(0f)
                    .alpha(1f)
                    .setDuration(500)
                    .setInterpolator(AccelerateDecelerateInterpolator())
                    .withEndAction(onComplete)
                    .start()
            }
            .start()
    }

    /**
     * Rotate and fade animation
     */
    fun rotateAndFade(logo: View, appName: View, onComplete: () -> Unit) {
        // Initial state
        logo.apply {
            rotation = -180f
            alpha = 0f
            scaleX = 0.5f
            scaleY = 0.5f
        }
        appName.apply {
            alpha = 0f
            translationY = 50f
        }

        // Animate logo with rotation
        logo.animate()
            .rotation(0f)
            .alpha(1f)
            .scaleX(1f)
            .scaleY(1f)
            .setDuration(1000)
            .setInterpolator(AccelerateDecelerateInterpolator())
            .withEndAction {
                // Animate app name
                appName.animate()
                    .alpha(1f)
                    .translationY(0f)
                    .setDuration(600)
                    .setInterpolator(AccelerateDecelerateInterpolator())
                    .withEndAction(onComplete)
                    .start()
            }
            .start()
    }

    /**
     * Zoom out animation - starts large
     */
    fun zoomOut(logo: View, appName: View, onComplete: () -> Unit) {
        // Initial state
        logo.apply {
            scaleX = 3f
            scaleY = 3f
            alpha = 0f
        }
        appName.apply {
            alpha = 0f
        }

        // Animate logo zoom out
        logo.animate()
            .scaleX(1f)
            .scaleY(1f)
            .alpha(1f)
            .setDuration(900)
            .setInterpolator(AccelerateDecelerateInterpolator())
            .withEndAction {
                // Animate app name fade in
                appName.animate()
                    .alpha(1f)
                    .setDuration(500)
                    .withEndAction(onComplete)
                    .start()
            }
            .start()
    }

    /**
     * Fade in simple animation
     */
    fun fadeIn(logo: View, appName: View, onComplete: () -> Unit) {
        // Initial state
        logo.alpha = 0f
        appName.alpha = 0f

        // Animate both together
        logo.animate()
            .alpha(1f)
            .setDuration(1000)
            .start()

        appName.animate()
            .alpha(1f)
            .setDuration(1000)
            .setStartDelay(300)
            .withEndAction(onComplete)
            .start()
    }

    /**
     * Combined animation - rotate, scale, and fade
     */
    fun combined(logo: View, appName: View, onComplete: () -> Unit) {
        // Initial state
        logo.apply {
            scaleX = 0.3f
            scaleY = 0.3f
            alpha = 0f
            rotation = -360f
        }
        appName.apply {
            alpha = 0f
            scaleX = 0.5f
            scaleY = 0.5f
        }

        // Complex animation
        logo.animate()
            .scaleX(1f)
            .scaleY(1f)
            .alpha(1f)
            .rotation(0f)
            .setDuration(1200)
            .setInterpolator(AccelerateDecelerateInterpolator())
            .withEndAction {
                appName.animate()
                    .alpha(1f)
                    .scaleX(1f)
                    .scaleY(1f)
                    .setDuration(600)
                    .setInterpolator(OvershootInterpolator())
                    .withEndAction(onComplete)
                    .start()
            }
            .start()
    }

    enum class AnimationType {
        SCALE_FADE,
        BOUNCE,
        SLIDE_LEFT,
        ROTATE_FADE,
        ZOOM_OUT,
        FADE_IN,
        COMBINED
    }

    /**
     * Apply animation based on type
     */
    fun applyAnimation(
        type: AnimationType,
        logo: View,
        appName: View,
        onComplete: () -> Unit
    ) {
        when (type) {
            AnimationType.SCALE_FADE -> scaleAndFade(logo, appName, onComplete)
            AnimationType.BOUNCE -> bounceIn(logo, appName, onComplete)
            AnimationType.SLIDE_LEFT -> slideFromLeft(logo, appName, onComplete)
            AnimationType.ROTATE_FADE -> rotateAndFade(logo, appName, onComplete)
            AnimationType.ZOOM_OUT -> zoomOut(logo, appName, onComplete)
            AnimationType.FADE_IN -> fadeIn(logo, appName, onComplete)
            AnimationType.COMBINED -> combined(logo, appName, onComplete)
        }
    }
}
