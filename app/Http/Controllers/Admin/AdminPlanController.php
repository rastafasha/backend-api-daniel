<?php

namespace App\Http\Controllers\Admin;

use App\Models\Plan;
use App\Models\User;
use App\Helpers\Uploader;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Http\Requests\PlanStoreRequest;
use App\Http\Requests\PlanUpdateRequest;

class AdminPlanController extends Controller
{
    // /**
    //  * Create a new AuthController instance.
    //  *
    //  * @return void
    //  */
    // public function __construct()
    // {
    //     $this->middleware('jwt.verify');
    // }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // $this->authorize('index', Plan::class);

        $plans = Plan::all();

        return response()->json([
            'code' => 200,
            'status' => 'success',
            'plans' => $plans,
        ], 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */



    public function planStore(Request $request){
        return Plan::create($request->all());
    }


    public function planUpdate(Request $request, $id)
    {
        $plan = Plan::findOrfail($id);
        $plan->name = $request->name;
        $plan->price = $request->price;
        $plan->currency_id = $request->currency_id;
        $plan->status = $request->status;
        $plan->color = $request->color;
        $plan->description = $request->description;
        $plan->tiempo = $request->tiempo;
        $plan->update();
        return $plan;

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */


    public function planShow(Plan $plan){
        // $this->authorize('planShow', Plan::class);


        if(is_object($plan)){
            $data = [
                'code' => 200,
                'status' => 'success',
                'plan' => $plan
            ];
        }else{
            $data = [
                'code' => 404,
                'status' => 'error',
                'message' => 'La plan no existe.'
            ];
        }
        return response()->json($data, $data['code']);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */




    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function planDestroy($id, Request $request){


        $plan =  Plan::where('id', $id)
                        ->first();

        if(!empty($plan)){

            // borrar
            $plan->delete();
            // devolver respuesta
            $data = [
                'code' => 200,
                'status' => 'success',
                'plan' => $plan
            ];
        }else{
            $data = [
                'code' => 404,
                'status' => 'error',
                'message' => 'el plan no existe'
            ];
        }

        return response()->json($data, $data['code']);
    }

    protected function planInput(string $fileName = null): array
    {
        return [
            "name" => request("name"),
            "price" => request("price"),
            "description" => request("description"),
            "color" => request("color"),
            "tiempo" => request("tiempo"),
            "currency_id" => request("currency_id"),
            "image" =>  $fileName,
        ];
    }


}
