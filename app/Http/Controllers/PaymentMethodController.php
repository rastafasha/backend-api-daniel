<?php

namespace App\Http\Controllers;

use App\Models\PaymentMethod;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;

class PaymentMethodController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $paymentmethods = PaymentMethod::orderBy('created_at', 'DESC')
        ->get();

        return response()->json([
            'code' => 200,
            'status' => 'Listar todos los Tipos de pago',
            'paymentmethods' => $paymentmethods,
        ], 200);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function createPaymentMethod(Request $request)
    {
        return PaymentMethod::create($request->all());
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\PaymentMethod  $paymentMethod
     * @return \Illuminate\Http\Response
     */
    public function showPaymentMethod(PaymentMethod $paymentmethod)
    {
        //
        // $paymentMethod = PaymentMethod::find($id);

        if (!$paymentmethod) {
            return response()->json([
                'message' => 'Tipo de pago not found.'
            ], 404);
        }

        return response()->json([
            'code' => 200,
            'status' => 'success',
            'paymentmethod' => $paymentmethod,
        ], 200);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\PaymentMethod  $paymentMethod
     * @return \Illuminate\Http\Response
     */
    public function PaymentMethodUpdate(PaymentMethod $paymentmethod)
    {
        try {
            DB::beginTransaction();

            $input = $request->all();
            $paymentmethod = PaymentMethod::find($id);
            $paymentmethod->update($input);


            DB::commit();
            return response()->json([
                'code' => 200,
                'status' => 'Update payment success',
                'paymentmethod' => $paymentmethod,
            ], 200);
        } catch (\Throwable $exception) {
            DB::rollBack();
            return response()->json([
                'message' => 'Error no update'  . $exception,
            ], 500);
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Request $request, $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $paymentmethod = PaymentMethod::findOrfail($id);
        $paymentmethod->modoPaypal = $request->modoPaypal;
        $paymentmethod->clienteIdPaypal = $request->clienteIdPaypal;
        $paymentmethod->llaveSecretaPaypal = $request->llaveSecretaPaypal;
        $paymentmethod->modoBinance = $request->modoBinance;
        $paymentmethod->merchantIdBinance = $request->merchantIdBinance;
        $paymentmethod->accountIdBinance = $request->accountIdBinance;
        $paymentmethod->accountIdBinance = $request->accountIdBinance;
        $paymentmethod->update();
        return $paymentmethod;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\PaymentMethod  $paymentMethod
     * @return \Illuminate\Http\Response
     */
    public function destroyPaymentMethod($id, Request $request){


        $paymentmethod =  PaymentMethod::where('id', $id)
                        ->first();

        if(!empty($paymentmethod)){

            // borrar
            $paymentmethod->delete();
            // devolver respuesta
            $data = [
                'code' => 200,
                'status' => 'success',
                'plan' => $paymentmethod
            ];
        }else{
            $data = [
                'code' => 404,
                'status' => 'error',
                'message' => 'el tipo de pago no existe'
            ];
        }

        return response()->json($data, $data['code']);
    }
}
