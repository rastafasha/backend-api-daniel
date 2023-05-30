<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Follow;
use Illuminate\Support\Facades\DB;

class FollowController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $follows = Follow::orderBy('created_at', 'DESC')
        ->get();

        return response()->json([
            'code' => 200,
            'status' => 'Listar todos los follows',
            'follows' => $follows,
        ], 200);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function createFollow(Request $request)
    {
        return Follow::create($request->all());
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Follow $follow
     * @return \Illuminate\Http\Response
     */
    public function showFollow(Follow $follow)
    {
        //
        if (!$follow) {
            return response()->json([
                'message' => 'Pago not found.'
            ], 404);
        }

        return response()->json([
            'code' => 200,
            'status' => 'success',
            'follow' => $follow,
        ], 200);
    }


    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Follow  $follow
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Follow $follow)
    {
        $follow = Follow::findOrfail($id);
        $follow->profile_id = $request->profile_id;
        $follow->category_id = $request->category_id;
        $follow->category_id = $request->category_id;
        $follow->update();
        return $follow;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Follow $follow
     * @return \Illuminate\Http\Response
     */
    public function destroyPaymentMethod(Follow $follow)
    {
        // $this->authorize('paymentDestroy', Follow::class);

        try {
            DB::beginTransaction();


            $follow->delete();

            DB::commit();
            return response()->json([
                'code' => 200,
                'status' => 'Payment Method deleted',
            ], 200);
        } catch (\Throwable $exception) {
            DB::rollBack();
            return response()->json([
                'status' => 'error',
                'message' => 'Borrado fallido. Conflicto',
            ], 409);
        }
    }
}
