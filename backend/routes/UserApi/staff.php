<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\staffApiController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

// Route::get('/staff/getById/{id}',[staffApiController::class, 'getOneStaff']);
Route::post('/staff/Registration',[staffApiController::class, 'StaffRegistration']);
Route::post('/staff/Login',[staffApiController::class, 'StaffLogin']);
Route::get('/staff/Dashboard/{name}',[staffApiController::class, 'UserDashboard']);
Route::get('/staff/Service/{name}',[staffApiController::class, 'AllService']);
Route::get('/staff/Profile/{id}',[staffApiController::class, 'ProfileDetails']);
Route::get('/staff/Orderaccept/{id}',[staffApiController::class, 'OrderAccept']);
Route::post('/staff/Changepassword',[staffApiController::class, 'ChangePassword']);
Route::post('/staff/Branchtransfer',[staffApiController::class, 'BranchTransfer']);
Route::post('/staff/Verification',[staffApiController::class,'Verify']);