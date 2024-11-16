<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use App\Models\User;
use Illuminate\Http\Request;

class UpdateUserInfo extends Controller
{

    public function updateUserInfo(Request $request)
    {
        // Retrieve the user based on the session token in headers
        $user = Auth::user();

        // Check if the user is authenticated
        if (!$user || !($user instanceof User)) {
            return response()->json(['message' => 'Unauthorized'], 401);
        }

        // Validate the request data
        $validatedData = $request->validate([
            'fullname' => 'required|string|max:255',
            'gender' => 'required|string|in:male,female', // Only 'male' or 'female' are allowed
        ]);

        // Update user information
        $user->fullname = $validatedData['fullname'];
        $user->gender = $validatedData['gender'];

        // Save the changes
        $user->save();

        // Return success response with updated user info
        return response()->json([
            'message' => 'User info updated successfully',
            'user' => $user,
        ], 200);
    }
}
