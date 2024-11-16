<?php

namespace App\Http\Controllers;

use App\Models\Car;
use Illuminate\Http\Request;

class CarController extends Controller
{
    public function addCar(Request $request)
    {
        // التحقق من صحة البيانات
        $validatedData = $request->validate([
            'name' => 'required|string|max:255',
            // 'image' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',
        ]);

        // رفع الصورة
        // if ($request->hasFile('image')) {
        //     $imagePath = $request->file('image')->store('car_images', 'public');
        // } else {
        //     return response()->json(['error' => 'Image upload failed.'], 422);
        // }

        // حفظ البيانات في قاعدة البيانات
        $car = new Car();
        $car->name = $validatedData['name'];
        // $car->image = $imagePath;
        $car->save();

        return response()->json([
            'id' => $car->id,
            'className' => 'Cars',
            'name' => $car->name,
            'image_url' => asset('storage/' . $car->image),
        ], 201);
    }

    public function editCar(Request $request)
    {
        $validatedData = $request->validate([
            'name' => 'required|string|max:255',
            // 'image' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',
        ]);

        // رفع الصورة
        // if ($request->hasFile('image')) {
        //     $imagePath = $request->file('image')->store('car_images', 'public');
        // } else {
        //     return response()->json(['error' => 'Image upload failed.'], 422);
        // }

        $car = new Car();
        $car->name = $validatedData['name'];
        // $car->image = $imagePath;
        $car->save();

        return response()->json([
            'id' => $car->id,
            'className' => 'Cars',
            'name' => $car->name,
            'image_url' => asset('storage/' . $car->image),
        ], 201);
    }

    public function deleteCar($value)
    {
        $car = Car::find($value);

        if (!$car) {
            $car = Car::where('name', $value)->first();
        }

        if ($car) {
            $car->delete();
            return response()->json(['message' => ' Car deleted successfully']);
        } else {
            return response()->json(['message' => 'the car not found']);
        }
    }
}
