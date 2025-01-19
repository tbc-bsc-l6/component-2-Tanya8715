<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class AuthController extends Controller
{
    /**
     * Handle user login.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function login(Request $request)
    {   
        // If the user is already logged in, redirect to the dashboard
        if (Auth::check()) {
            return redirect()->route('dashboard');
        }

        // Process POST request for login
        if ($request->isMethod("POST")) {
            // Validate the request data
            $request->validate([
                'email' => 'required|email',
                'password' => 'required',
            ]);

            // Find the user by email and check if the account is enabled
            $user = User::where('email', $request->email)
                        ->where('is_enabled', true)
                        ->first();
            
            // Check if the user exists
            $credentials = $request->only('email', 'password');
            
            if (is_null($user)) {
                return redirect()->back()->with('error', 'Invalid credentials');
            } else {
                // Attempt to log the user in with credentials
                if (Auth::attempt($credentials, $request->remember)) {
                    return redirect()->route('dashboard')->with('success', 'Signed in');
                } else {
                    return redirect()->back()->with('error', 'Invalid credentials');
                }
            }
        }

        // Display login page if GET request
        return view('pages.login');
    }

    /**
     * Handle user registration.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function register(Request $request)
    {
        // Process POST request for registration
        if ($request->isMethod("POST")) {
            // Validate the incoming request data
            $request->validate([
                'name' => 'required|string|max:255',
                'email' => 'required|email|unique:users,email',
                'password' => 'required|min:6|confirmed', // Password confirmation field
            ]);

            // Create a new user record
            User::create([
                'name' => $request->name,
                'email' => $request->email,
                'password' => Hash::make($request->password), // Hash the password
                'email_verified_at' => now(), // Automatically verify email
                'is_enabled' => true, // Enable the user by default
                'remember_token' => Str::random(10), // Generate a random remember token
                'type' => 'user', // Assign user type as 'user'
            ]);

            // Redirect to login page with a success message
            return redirect()->route('login')->with('success', 'Registration successful. You can now login.');
        }

        // Display the registration page if GET request
        return view('auth.register');
    }

    /**
     * Handle user logout.
     *
     * @return \Illuminate\Http\Response
     */
    public function logout()
    {
        // Logout the user and redirect to login page
        Auth::logout();
        return redirect()->route('login');
    }
}
