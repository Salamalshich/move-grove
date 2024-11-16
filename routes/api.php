<?php

use App\Http\Controllers\AddCarController;
use App\Http\Controllers\AddCity;
use App\Http\Controllers\CarController;
use App\Http\Controllers\CityController;
use App\Http\Controllers\loginAdmin;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\generateOtp;
use App\Http\Controllers\ContinueWithMobile;
use App\Http\Controllers\GetTripsController;
use App\Http\Controllers\RatingController;
use App\Http\Controllers\TripController;
use App\Http\Controllers\TripsDetailsController;
use App\Http\Controllers\ToReuseController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/



Route::middleware('auth:api')->get('/user', function (Request $request) {

    return $request->user();
});


Route::post('/login-admin', [loginAdmin::class, 'loginAdmin']);

Route::post('/generate-otp', [generateOtp::class, 'generateOtp']);

Route::post('/cwm', [continueWithMobile::class, 'continueWithMobile']);

Route::post('/add-car', [CarController::class, 'addCar']);

Route::post('/edit-car', [CarController::class, 'editCar']);

Route::delete('/delete-car/{value}', [CarController::class, 'deleteCar']);

Route::post('/add-city', [CityController::class, 'addCity']);

Route::delete('/delete-city/{id}', [CityController::class, 'deleteCity']);
//مشاكل بالحذف
Route::post('/join-trip', [TripController::class, 'joinTrip']);

Route::post('/add-trip', [TripController::class, 'addTrip']);

Route::get('/avilable-trips', action: [GetTripsController::class, 'index']);

Route::get('/get-trips', [GetTripsController::class, 'getTrips']);

Route::get('/trips-details', [TripsDetailsController::class, 'show']);

Route::get('/trips-status', [ToReuseController::class, 'getTripsStatusById']);

Route::get('/trips-passengers', [ToReuseController::class, 'getTripsPassengerStatusById']);

Route::post('/ratings', [RatingController::class, 'store']);

Route::get('/showWithAverage', [RatingController::class, 'showWithAverage']);


