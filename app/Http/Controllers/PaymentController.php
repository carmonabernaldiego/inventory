<?php

namespace App\Http\Controllers;

use App\Payment;
use Illuminate\Http\Request;
use App\Sell;
use App\SellDetails;
use Auth;

use DB;

class PaymentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
          'payment_date' => 'required',
          'payment_amount' => 'required|regex:/^[0-9]+(\.[0-9][0-9]?)?$/',          
          'payment_in' => 'required',                 
        ]);

        try{
          
          $sell = Sell::find($request->id);

          $payment = new Payment;

          $payment->sell_id = $request->id;
          $payment->customer_id = $sell->customer_id;
          $payment->user_id = Auth::user()->id;
          $payment->date = date("Y-m-d", strtotime($request->payment_date));
          $payment->amount = $request->payment_amount;
          $payment->paid_in = $request->payment_in;
          $payment->bank_information = $request->bank_info;

          $payment->save();

          $paid_amount = $sell->paid_amount+$request->payment_amount;

          if($paid_amount>=$sell->total_amount){
            
            $sell->payment_status = 1;
          }

          $sell->paid_amount = $paid_amount;

          $sell->save();

          return response()->json(['status'=>'success','message'=>'Payment Success']);



        }
        catch(\Exception $e){
          
          return response()->json(['status'=>'error','message'=>'Something Went Wrong']);

        

        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Payment  $payment
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
       
        $sell = Sell::with('customer')->find($id);

        $payment = Payment::with('user')->where('sell_id','=',$id)->get();


        return ['payment' => $payment,'invoice' => $sell];
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Payment  $payment
     * @return \Illuminate\Http\Response
     */
    public function edit(Payment $payment)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Payment  $payment
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Payment $payment)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Payment  $payment
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        
    try{

         DB::beginTransaction();

        $payment = Payment::find($id);

        $sell = Sell::find($payment->sell_id);

        $sell->paid_amount = $sell->paid_amount - $payment->amount;

        $sell->update();

        $payment->delete();

        DB::commit();

        return response()->json(['status'=>'success','message'=>'Delete Success']);



     }
    catch(\Exception $e)
    {
        DB::rollback();

        return response()->json(['status'=>'error','message'=>'¡Algo salió mal!']);

    }

    }
}
