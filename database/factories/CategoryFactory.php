<?php
namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;
use App\Models\Category;

class CategoryFactory extends Factory
{
    protected $model = Category::class;

    public function definition()
    {
        $title = $this->faker->sentence();
        
        return [
            "title" => $title,
            "slug" => Str::slug($title)
        ];
    }
}

