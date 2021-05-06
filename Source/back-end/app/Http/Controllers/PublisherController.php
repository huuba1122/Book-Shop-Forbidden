<?php

namespace App\Http\Controllers;

use App\Models\Publisher;
use Illuminate\Http\Request;

class PublisherController extends Controller
{
   public function getAll(): \Illuminate\Http\JsonResponse
   {
       $publishers = Publisher::all();
       return response()->json($publishers);
   }
}
