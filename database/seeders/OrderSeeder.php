<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Order;

use Database\Factories\OrderFactory;

class OrderSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        
        {
            Order::factory()->count(10)->create([
                'user_id' => 2, // Replace 1 with the actual user's ID
            ]);// Remplacez 1 par l'ID de l'utilisateur auquel cet enregistrement est associé
       
    }
}
}