<?php
namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Faker\Generator as Faker;
use App\Models\Order;

class OrderFactory extends Factory
{
    protected $model = Order::class;

    public function definition()
    {
        return [
            "product_name" => $this->faker->sentence,
            "price" => $this->faker->numberBetween($min = 100, $max = 900),
            "total" => $this->faker->numberBetween($min = 1000, $max = 9000),
            "qty" => $this->faker->numberBetween($min = 1, $max = 10),
            "user_id" => $this->faker->numberBetween($min = 1, $max = 10)
        ];
    }
}
