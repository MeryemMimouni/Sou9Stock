<?php
namespace Database\Seeders;


use Illuminate\Database\Seeder;


class DatabaseSeeder extends Seeder
{
    public function run(): void
    {
         \App\Models\User::factory(10)->create();

         \App\Models\User::factory()->create([
             'name' => 'Test User',
            'email' => 'meryem@email.com',
         ]);
         $this->call(UsersTableSeeder::class);
         $this->call(CategorySeeder::class);
         $this->call(ProductSeeder::class);
         $this->call(OrderSeeder::class);
         $this->call(AdminTableSeeder::class);
    }
}
