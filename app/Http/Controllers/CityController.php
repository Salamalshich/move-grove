<?php

namespace App\Http\Controllers;

use App\Models\City;
use Illuminate\Http\Request;

class CityController extends Controller
{
    public function addCity(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
        ]);

        $city = new City();
        $city->name = $request->name;
        $city->save();

        return response()->json(['message' => 'City added successfully', 'city' => $city], 201);
    }
    public function deleteCity($id)
    {
        $city = City::find($id);

        if (!$city) {
            return response()->json(['message' => 'The city not found']);
        }

        $city->delete();
        throw response()->json(['message' => 'City deleted successfully']);
    }
}
