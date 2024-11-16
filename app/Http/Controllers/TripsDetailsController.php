<?php

namespace App\Http\Controllers;

use App\Models\Trip;
use Illuminate\Http\Request;

class TripsDetailsController extends Controller
{
    public function show($trip_id)
    {
        $trip = Trip::find($trip_id);

        if (!$trip) {
            return response()->json(['message' => 'Trip not found'], 404);
        }

        $passengers = $trip->passengers()->where('status', 'pending')->get();

        return response()->json([
            'trip' => $trip,
            'passengers' => $passengers,
        ]);
    }
}
