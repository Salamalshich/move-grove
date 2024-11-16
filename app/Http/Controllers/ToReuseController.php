<?php

namespace App\Http\Controllers;

use App\Models\Trip;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ToReuseController extends Controller
{
    /*ملاااااااااحظة 
استرجاع الرحلات التي تقدم إليها الراكب:
يمكنك استرجاع الرحلات 

$user = User::find($user_id);
$trips = $user->tripPassengers()->where('status', 'pending')->get();
*/

    public function getTripsStatusById($id)
    {
        // مين بدو يعملا
        if (Auth::check() && Auth::user()->id == 2) {
            $trip = Trip::find($id);
            if (!$trip) {
                return response()->json([
                    'message' => 'Trip not found.'
                ], 404);
            }

            return response()->json([
                'trip_id' => $trip->id,
                'status' => $trip->status
            ]);
        } else {
            return response()->json([
                'message' => 'Acsess Denied.'
            ], 404);
        }
    }

    public function getTripsPassengerStatusById($id, $passengerId)
    {
        $trip = Trip::find($id);

        if (!$trip) {
            return response()->json([
                'message' => 'Trip not found.'
            ], 404);
        }

        $passenger = $trip->passengers()->find($passengerId);

        // If the passenger is not found, return an error response
        if (!$passenger) {
            return response()->json([
                'message' => 'Passenger not found for this trip.'
            ], 404);
        }

        return response()->json([
            'trip_id' => $trip->id,
            'passenger_id' => $passenger->id,
            'status' => $passenger->status
        ]);
    }
}
