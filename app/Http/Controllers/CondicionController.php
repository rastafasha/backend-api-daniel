<?php

namespace App\Http\Controllers;


use App\Models\Condicion;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;



class CondicionController extends Controller
{
    public function index()
    {
        // $this->authorize('index', User::class);

        $condiciones = Condicion::orderBy('created_at', 'DESC')
        ->withCount([
            "users",
        ])
        ->get();

            return response()->json([
                'code' => 200,
                'status' => 'Listar todos lass condiciones',
                'condiciones' => $condiciones,
            ], 200);
    }

    public function store(Request $request)
    {
        return Condicion::create($request->all());
    }
}
