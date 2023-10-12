<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use App\Models\User;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {

        // Admin
        User::create([
            'name' => 'Amirol',
            'email' => 'amiroltest@ikursus.com',
            'password' => 'pass123',
            'phone' => '0123456789',
            'role' => 'admin',
        ]);


        User::create([
            'name' => 'Zaki',
            'email' => 'zaki@jtc.com',
            'password' => 'pass123',
            'phone' => '0123456789',
            'role' => 'admin',
        ]);

        // User
        User::factory(10)->create();

        // \App\Models\User::factory()->create([
        //     'name' => 'Test User',
        //     'email' => 'test@example.com',
        // ]);
    }
}
