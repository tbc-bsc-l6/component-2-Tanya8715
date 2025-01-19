<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;  // Import the User model
use Illuminate\Support\Facades\Hash;  // Import Hash facade
use Illuminate\Support\Str;  // Import Str facade

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // Create a specific user with a password and enabled status
        User::create([
            'name' => 'Test User',
            'email' => 'test@example.com',
            'password' => Hash::make('password123'),
            'email_verified_at' => now(),
            'is_enabled' => true,
            'remember_token' => Str::random(10),
            'type' => 'user',  // Provide a value for the 'type' field
        ]);
        

        // You can also use a factory to generate more users
        \App\Models\User::factory(10)->create();
    }
}
