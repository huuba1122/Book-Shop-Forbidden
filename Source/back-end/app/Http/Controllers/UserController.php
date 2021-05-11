<?php

namespace App\Http\Controllers;

use App\Http\Requests\RegisterUserRequest;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Tymon\JWTAuth\Exceptions\JWTException;
use Tymon\JWTAuth\Exceptions\TokenExpiredException;
use Tymon\JWTAuth\Exceptions\TokenInvalidException;
use Tymon\JWTAuth\Facades\JWTAuth;

class UserController extends Controller
{

    function register(Request $request)
    {
//        dd($request->name, $request->email);
        try {
            $user = new User();
            $user->name = $request->name;
            $user->email = $request->email;
            $user->address = $request->address;
            $user->phone = $request->phone;
            $user->password = Hash::make($request->password);
            $user->save();
        }catch (\Exception $e){
            return response()->json($e->getMessage());
        }
        return response()->json([
            'status' => 'success'
        ]);
    }

    function login(Request $request)
    {
        $credentials = $request->only('email', 'password');
        try {
            if (! $token = JWTAuth::attempt($credentials)){
                return response()->json([
                   'status' => 'error',
                   'message' => 'Email or password is not correct'
                ]);
            }
        }catch (JWTException $e){
            return response()->json([
                'error' => 'could not create token !!'
            ], 500);
        }
        $user = Auth::user();

        return response()->json([
            'status' => 'successfully',
            'user' => $user,
            'token' => $token
        ], 200);
    }

    function getUser()
    {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['status' => 'user not found'], 404);
            }
        }catch (TokenExpiredException $e){
            return response()->json(['status' => 'token expired'], $e->getStatusCode());
        }catch (TokenInvalidException $e){
            return response()->json(['status' => 'token invalid'], $e->getStatusCode());
        }catch (JWTException $e){
            return response()->json(['status' => 'token absent'], $e->getStatusCode());
        }
        return response()->json(['user' => $user], 201);
    }

    function logout(Request $request){
        try {
            JWTAuth::invalidate($request->bearerToken());
            return response()->json(['status' => 'success', 'message' => 'logout successfully']);
        }catch (JWTException $e){
            return response()->json(['status' => 'error', 'message' => 'Sorry, the user cannot be logout'], 500);
        }
    }

}
