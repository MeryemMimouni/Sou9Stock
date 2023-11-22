<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;
use App\Models\Product;

class ProductFactory extends Factory
{
    protected $model = Product::class;
    
    public function definition()
    {
        $title = $this->faker->sentence();
         
        return [
            "title" => $title,
            "slug" => Str::slug($title),
            "description" => $this->faker->paragraph,
            "price" => $this->faker->numberBetween($min = 100, $max = 900),
            "old_price" => $this->faker->numberBetween($min = 100, $max = 900),
            "inStock" => $this->faker->numberBetween($min = 1, $max = 10),
            "image" => $this->faker->imageUrl($width = 640, $height = 480),
            "category_id" => $this->faker->numberBetween($min = 1, $max = 10)
        ];
    }
}
