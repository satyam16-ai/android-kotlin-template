package com.example.myapplication.network

/**
 * API Service interface for Retrofit
 * Author: Satyam (@satyam16-ai)
 * 
 * Uncomment the Retrofit dependencies in build.gradle to use this
 * 
 * Example usage:
 * 
 * import retrofit2.http.GET
 * import retrofit2.http.Query
 * 
 * interface ApiService {
 *     
 *     @GET("users")
 *     suspend fun getUsers(): List<User>
 *     
 *     @GET("user/{id}")
 *     suspend fun getUserById(@Path("id") userId: Int): User
 *     
 *     @POST("user")
 *     suspend fun createUser(@Body user: User): User
 *     
 *     @PUT("user/{id}")
 *     suspend fun updateUser(@Path("id") userId: Int, @Body user: User): User
 *     
 *     @DELETE("user/{id}")
 *     suspend fun deleteUser(@Path("id") userId: Int): Response<Unit>
 * }
 */

// Uncomment and modify based on your API structure
/*
import retrofit2.Response
import retrofit2.http.*

interface ApiService {
    
    // Example GET request
    @GET("posts")
    suspend fun getPosts(): List<Post>
    
    // Example POST request
    @POST("posts")
    suspend fun createPost(@Body post: Post): Post
    
    // Example with query parameters
    @GET("posts")
    suspend fun getPostsByUser(@Query("userId") userId: Int): List<Post>
}

// Example data class
data class Post(
    val id: Int,
    val title: String,
    val body: String,
    val userId: Int
)
*/
