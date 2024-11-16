<?php

namespace App\Http\Controllers;

use App\Models\Trip;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class TripController extends Controller
{
    public function joinTrip(Request $request)
    {


        $validator = Validator::make($request->all(), [
            'trip_id' => 'required|integer|exists:trips,id',
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => 'Invalid Parameters'], 401);
        }

        $trip_id = $request->trip_id;


        $trip = Trip::find($trip_id);

        if (!$trip) {
            return response()->json(['message' => 'الرحلة غير موجودة'], 404);
        }


        // إضافة العميل إلى الرحلة
        // نحن نفترض أن العميل الذي يريد الانضمام هو المستخدم الحالي
        $user = Auth::user(); // الحصول على المستخدم المتصل حاليًا

        // تحقق إذا كان المستخدم قد انضم بالفعل إلى هذه الرحلة
        if ($trip->users->contains($user->id)) {
            return response()->json(['message' => 'أنت بالفعل عضو في هذه الرحلة'], 400);
        }

        // إضافة المستخدم إلى الرحلة
        $trip->users()->attach($user->id);

        return response()->json([
            'message' => 'The trip has been successfully joined ',
            'trip' => $trip
        ]);
    }


    public function addTrip(Request $request)
    {
        $request->validate([
            'plate_number' => 'required|string|max:10',
            'price' => 'required|numeric|min:0',
            'total_seats' => 'required|integer|min:1',
            'dateTime' => 'required|date',
        ]);
        $user = Auth::user(); // الحصول على المستخدم المتصل حاليًا
        if (!$user) {
            return response()->json(['message' => 'يجب تسجيل الدخول لإضافة رحلة.'], 401);
        }

        $trip = new Trip();
        $trip->plate_number = $request->plate_number;
        $trip->notes = $request->notes;
        $trip->price = $request->price;
        $trip->total_seats = $request->total_seats;
        $trip->dateTime = $request->dateTime;
        $trip->driver_id = $user->id; // تعيين معرف السائق

        $trip->save();

        return response()->json(['message' => 'Trip added successfully!', 'trip' => $trip]);
    }
    /**{
    "plate_number": "ABC123",
    "notes": "This is a test trip",
    "price": 100,
    "total_seats": 4,
    "dateTime": "2024-12-01T15:00:00"
}
     */
}
