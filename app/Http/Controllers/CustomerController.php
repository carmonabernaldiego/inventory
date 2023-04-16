<?php

namespace App\Http\Controllers;

use App\Customer;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CustomerController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        return view('customer.customer');
       
    }


    public function CustomerList(Request $request){
        
        $name = $request->name;
        $email = $request->email;
        $phone = $request->phone;
        $customer = Customer::withCount([
            'sell AS total_amount' => function ($query){
      
              $query->select(DB::raw("COALESCE(SUM(total_amount),0)"));
              
            },
            
            'sell AS total_paid_amount' => function ($query){
      
              $query->select(DB::raw("COALESCE(SUM(paid_amount),0)"));
              
            },
            
            ])->orderBy('customer_name','asc');

            if($name != ''){
             
                $customer->where('customer_name','LIKE','%'.$name.'%');

            }

            if($email != ''){
                 
                $customer->where('email','LIKE','%'.$email.'%');

            }

            if($phone != ''){
               
                $customer->where('phone','LIKE','%'.$phone.'%');

            }
            
            $customer = $customer->paginate(10);

            return $customer;

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
         
            'customer_name' => 'required',
            'email' => 'nullable|email|unique:customers',
            'phone' => 'nullable|numeric|unique:customers',
        ]);
       
        try{
            $customer = new Customer;

            $customer->customer_name = $request->customer_name;
            $customer->email = $request->email;
            $customer->phone = $request->phone;
            $customer->address = $request->address;
            $customer->save();

            return response()->json(['status'=>'success','message'=>'Cliente agregado']);
        }
        catch(\Exception $e)
        {
         
            return response()->json(['status'=>'error','message'=>'¡Algo salió mal!']);

        }
    


    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Customer  $customer
     * @return \Illuminate\Http\Response
     */
    public function show(Customer $customer)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Customer  $customer
     * @return \Illuminate\Http\Response
     */
    public function edit(Customer $customer)
    {
        return $customer;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Customer  $customer
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request,$id)
    {
        $request->validate([
         
            'customer_name' => 'required',
            'email' => 'nullable|email|unique:customers,email,'.$request->id,
            'phone' => 'nullable|numeric|unique:customers,email,'.$request->id,
        ]);
       
        try{
            $customer = Customer::find($id);
            $customer->customer_name = $request->customer_name;
            $customer->email = $request->email;
            $customer->phone = $request->phone;
            $customer->address = $request->address;
            $customer->update();

            return response()->json(['status'=>'success','message'=>'Información del cliente actualizada']);
        }
        catch(\Exception $e)
        {
         
            return response()->json(['status'=>'error','message'=>'¡Algo salió mal!']);

        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Customer  $customer
     * @return \Illuminate\Http\Response
     */
    public function destroy(Customer $customer)
    {
        //
    }
}
