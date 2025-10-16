package com.example.myapplication.network

/**
 * Retrofit Client Setup
 * Author: Satyam (@satyam16-ai)
 * 
 * This file contains the setup for Retrofit HTTP client
 * Uncomment the Retrofit dependencies in build.gradle to use this
 * 
 * Features:
 * - OkHttp logging interceptor for debugging
 * - Gson converter for JSON parsing
 * - Timeout configuration
 * - Base URL configuration
 */

// Uncomment and modify based on your needs
/*
import okhttp3.OkHttpClient
import okhttp3.logging.HttpLoggingInterceptor
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import java.util.concurrent.TimeUnit

object RetrofitClient {
    
    // Change this to your API base URL
    private const val BASE_URL = "https://jsonplaceholder.typicode.com/"
    
    // Logging interceptor for debugging
    private val loggingInterceptor = HttpLoggingInterceptor().apply {
        level = HttpLoggingInterceptor.Level.BODY
    }
    
    // OkHttp client configuration
    private val okHttpClient = OkHttpClient.Builder()
        .addInterceptor(loggingInterceptor)
        .connectTimeout(30, TimeUnit.SECONDS)
        .readTimeout(30, TimeUnit.SECONDS)
        .writeTimeout(30, TimeUnit.SECONDS)
        .build()
    
    // Retrofit instance
    private val retrofit: Retrofit by lazy {
        Retrofit.Builder()
            .baseUrl(BASE_URL)
            .client(okHttpClient)
            .addConverterFactory(GsonConverterFactory.create())
            .build()
    }
    
    // API Service
    val apiService: ApiService by lazy {
        retrofit.create(ApiService::class.java)
    }
}

// Usage example in Activity/ViewModel:
/*
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext

class MainActivity : AppCompatActivity() {
    
    private fun fetchData() {
        CoroutineScope(Dispatchers.IO).launch {
            try {
                val posts = RetrofitClient.apiService.getPosts()
                withContext(Dispatchers.Main) {
                    // Update UI with posts
                }
            } catch (e: Exception) {
                withContext(Dispatchers.Main) {
                    // Handle error
                }
            }
        }
    }
}
*/
*/
