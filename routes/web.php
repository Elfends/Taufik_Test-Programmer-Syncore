<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/',[App\Http\Controllers\UserController::class, 'login']);
Route::get('login-auth',[App\Http\Controllers\UserController::class, 'auth']);
Route::get('login-red',[App\Http\Controllers\UserController::class, 'logred']);
Route::get('detail/{id}',[App\Http\Controllers\UserController::class, 'detail']);
Route::get('list-calon',[App\Http\Controllers\UserController::class, 'listCalon']);