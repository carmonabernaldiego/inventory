<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Category;
use App\Product;
use App\Stock;
use App\StockDetails;
use App\Vendor;
use App\Customer;
use App\Sell;
use App\SellDetails;
use App\Payment;
use App\Company;
use DB;
use Auth;

class InvoiceController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
       $category = Category::orderBy('name','asc')->get();
       $customer = Customer::orderBy('customer_name','asc')->get();

       return view('invoice.invoice',[
        'category'=>$category,
        'customer'=>$customer
        ]);
    }


    public function getLastInvoice(){

            
            $invoice = Sell::orderBy('id','desc')->first();

            if($invoice){

                return $invoice->id + 1;
            }
            else{

                return 1;
            }

    }


    public function InvoiceList(Request $request){

         $invoice = Sell::with([

        'customer'=>function($query){

            $query->select('customer_name','id');
         },    

         'user'=>function($query){

            $query->select('name','id');
         }])
         ->orderBy('updated_at','desc');

          if($request->invoice_id != ''){
      
             $invoice->where('id','=',$request->invoice_id);
          }

          if ($request->customer_id != ''){
             
             $invoice->where('customer_id','=',$request->customer_id);
          }  

          if ($request->start_date != '' && $request->end_date != ''){
             
             $invoice->whereBetween('sell_date',[$request->start_date,$request->end_date]);
          }
          $invoice = $invoice->paginate(10);


         return $invoice;
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
          'customer_type' => 'required',
          'customer_id' => 'required_if:customer_type,1',
          'customer_name' => 'required_if:customer_type,2',
          'customer_email' => 'nullable|unique:customers,email',
          'customer_phone' => 'nullable|unique:customers,phone',
          'invoice_date' => 'required',
          'paid_amount' => 'nullable|regex:/^[0-9]+(\.[0-9][0-9]?)?$/',


          'product.*.category' => 'required',
          'product.*.product_id' => 'required',
          'product.*.chalan_id' => 'required',
          'product.*.quantity' => 'required|integer',
          'product.*.price' => 'required|regex:/^[0-9]+(\.[0-9][0-9]?)?$/',
          'product.*.total_price' => 'required|regex:/^[0-9]+(\.[0-9][0-9]?)?$/',
          'product.*.discount' => 'nullable|regex:/^[0-9]+(\.[0-9][0-9]?)?$/',
        ],[
           
          'customer_id.required_if' => 'required',
          'customer_name.required_if' => 'required',

          'product.*.category.required' => 'required field',
          'product.*.product_id.required' => 'required field',
          'product.*.chalan_id.required' => 'required field',
          'product.*.quantity.required' => 'required',
          'product.*.quantity.integer' => 'required',
          'product.*.price.required' => 'required',
          'product.*.total_price.required' => 'required',
          'product.*.discount.regex' => 'invalid format',  
        ]);


        try{

            DB::beginTransaction();
           
           // customer adding  
            if($request->customer_type == 1){
                
                 $customer_id = $request['customer_id']['id'];
            }
            else{

                $customer = new Customer;
                $customer->customer_name = $request->customer_name;
                $customer->email = $request->customer_email;
                $customer->phone = $request->customer_phone;
                $customer->address = $request->customer_address;

                $customer->save();

                $customer_id = $customer->id;


            }
            
 
           // invoice 

            $invoice = new Sell;

            $invoice->user_id = Auth::user()->id;  
            $invoice->customer_id = $customer_id;  
            $invoice->branch_id = Auth::user()->branch_id;  
            $invoice->total_amount = $request->grand_total;  
            $invoice->discount_amount = $request->total_discount;  
            $invoice->paid_amount = $request->paid_amount;  
            $invoice->sell_date = date("Y-m-d", strtotime($request->invoice_date));  
            $invoice->payment_method = $request->payment_info == 'cash' ? 1 : 2;
            if($request->paid_amount >= $request->grand_total){
             $invoice->payment_status = 1; 
              } 
            else{
            $invoice->payment_status = 0;    
              }
            $invoice->save();


            // invoice details 

            // n $request->product;
            // return $stock = Stock::find($request->product[1]['chalan_id']);
            // exit();

            foreach ($request->product as  $value) {
                
               $stock = Stock::find($value['chalan_id']);

               $inv_details = new SellDetails;
               
               $inv_details->stock_id = $value['chalan_id'];
               $inv_details->sell_id = $invoice->id;
               $inv_details->product_id = $value['product_id']['id'];
               $inv_details->category_id = $value['category']['id'];
               $inv_details->customer_id = $customer_id;
               $inv_details->vendor_id = $stock->vendor_id;
               $inv_details->user_id = Auth::user()->id;
               $inv_details->chalan_no = $stock->chalan_no;
               $inv_details->selling_date = date("Y-m-d", strtotime($request->invoice_date));
               $inv_details->sold_quantity = $value['quantity'];
               $inv_details->buy_price = $stock->buying_price;
               $inv_details->sold_price = $value['price'];
               $inv_details->total_buy_price = $stock->buying_price*$value['quantity'];
               $inv_details->total_sold_price = $value['total_price'];
               $inv_details->discount = $value['discount'];
               $inv_details->discount_type = $value['discount_type'];
               $inv_details->discount_amount = $value['discount_amount'];

               $inv_details->save();

               $stock->current_quantity = $stock->current_quantity - $value['quantity'];

               $stock->update();

               
            
            }


            // payment history 

            if($request->paid_amount > 0){

                $payment = new Payment;

                $payment->sell_id = $invoice->id;
                $payment->customer_id = $customer_id;
                $payment->user_id = Auth::user()->id;
                $payment->date = date("Y-m-d", strtotime($request->invoice_date));
                $payment->paid_in = $request->payment_in;
                $payment->bank_information = $request->bank_info;
                $payment->amount = $request->paid_amount;
                $payment->save();

            }
             
             DB::commit();

            return response()->json(['status' => 'success', 'message' => '¡Factura creada!']);
            }
               catch(\Exception $e){
             
             DB::rollback();
             return $e;
             return response()->json(['status'=>'error','message'=>'¡Algo salió mal!']);
        }
 
     
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        
        $invoice = Sell::find($id);

        $invoice_details = SellDetails::with(['stock.category:id,name','stock.product:id,product_name'])
                          ->where('sell_id','=',$id)->get();

        $payment = Payment::where('sell_id','=',$id)->get();

        $company = Company::find(1);

        return view('invoice.print_invoice',[
           'invoice' => $invoice,
           'invoice_details' => $invoice_details,
           'payment' => $payment,
           'company' => $company,
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $sell = Sell::find($id);

        
         $invoice_details = SellDetails::where('sell_details.sell_id','=',$id)
                                   ->get();

                                   

        $arr = [
          
          'invoice_no' => $sell->id,
          'customer_id' => $sell->customer_id,
          'total_discount' => $sell->discount_amount,
          'total_amount' => $sell->total_amount+$sell->discount_amount,
          'invoice_date' => $sell->sell_date,
          'grand_total' => $sell->total_amount,
          'paid_amount' => $sell->paid_amount,
           
           'product' => []

        ];
       
       $product = [];
       foreach ($invoice_details as $key => $value) {
           
           $products = Product::where('category_id','=',$value->category_id)->get();
           $stocks = Stock::where('product_id','=',$value->product_id)->get();
           $product['id'] = $value->id; 
           $product['category'] = $value->category_id; 
           $product['product_id'] = $value->product_id; 
           $product['chalan_id'] = $value->stock_id; 
           $product['stock_quantity'] = 0; 
           $product['quantity'] = $value->sold_quantity; 
           $product['price'] = $value->sold_price; 
           $product['total_price'] = $value->total_selling_price; 
           $product['discount'] = $value->discount; 
           $product['discount_type'] = $value->discount_type; 
           $product['discount_amount'] = $value->discount_amount; 
           $product['products'] = $products; 
           $product['stocks'] = $stocks; 

          array_push($arr['product'],$product);
       }

        return $arr;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {


           $request->validate([
          'customer_id' => 'required',
          'invoice_date' => 'required',


          'product.*.category' => 'required',
          'product.*.product_id' => 'required',
          'product.*.chalan_id' => 'required',
          'product.*.quantity' => 'required|integer',
          'product.*.price' => 'required|regex:/^[0-9]+(\.[0-9][0-9]?)?$/',
          'product.*.total_price' => 'required|regex:/^[0-9]+(\.[0-9][0-9]?)?$/',
          'product.*.discount' => 'nullable|regex:/^[0-9]+(\.[0-9][0-9]?)?$/',
        ],[
           
          'customer_id' => 'required',

          'product.*.category.required' => 'required field',
          'product.*.product_id.required' => 'required field',
          'product.*.chalan_id.required' => 'required field',
          'product.*.quantity.required' => 'required',
          'product.*.quantity.integer' => 'required',
          'product.*.price.required' => 'required',
          'product.*.total_price.required' => 'required',
          'product.*.discount.regex' => 'invalid format',  
        ]);
          


        try{

            DB::beginTransaction();
  

            $invoice = Sell::find($id);

            $invoice->customer_id = $request->customer_id;   
            $invoice->total_amount = $request->grand_total;  
            $invoice->discount_amount = $request->total_discount;  
            $invoice->paid_amount = $request->paid_amount;  
            $invoice->sell_date = date("Y-m-d", strtotime($request->invoice_date));  
            
            $invoice->update();

         $details = SellDetails::where('sell_id','=',$id)->get();

            foreach ($details as $key => $sell) {
               
               $old_stock = Stock::find($sell->stock_id);

               $old_stock->current_quantity = $old_stock->current_quantity+$sell->sold_quantity;

               $old_stock->update();

             }

              SellDetails::where('sell_id','=',$id)->delete();

            foreach ($request->product as  $value) {
                
               $stock = Stock::find($value['chalan_id']);

               $inv_details = new SellDetails;
               
               $inv_details->stock_id = $value['chalan_id'];
               $inv_details->sell_id = $invoice->id;
               $inv_details->product_id = $value['product_id'];
               $inv_details->category_id = $value['category'];
               $inv_details->customer_id = $request->customer_id;
               $inv_details->vendor_id = $stock->vendor_id;
               $inv_details->user_id = Auth::user()->id;
               $inv_details->chalan_no = $stock->chalan_no;
               $inv_details->selling_date = date("Y-m-d", strtotime($request->invoice_date));
               $inv_details->sold_quantity = $value['quantity'];
               $inv_details->buy_price = $stock->buying_price;
               $inv_details->sold_price = $value['price'];
               $inv_details->total_buy_price = $stock->buying_price*$value['quantity'];
               $inv_details->total_sold_price = $value['total_price'];
               $inv_details->discount = $value['discount'];
               $inv_details->discount_type = $value['discount_type'];
               $inv_details->discount_amount = $value['discount_amount'];

               $inv_details->save();

               $stock->current_quantity = $stock->current_quantity - $value['quantity'];

               $stock->update();

               
            
            }

             
             DB::commit();

            return response()->json(['status' => 'success', 'message' => '¡Factura actualizada!']);
            }
               catch(\Exception $e){
             
             DB::rollback();

             return $e;
             return response()->json(['status'=>'error','message'=>'¡Algo salió mal!']);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        
        try{
           DB::beginTransaction();

           // delete sell 
             
            $sell = Sell::find($id);

            $sell->delete();

           // delete Sell details 

            $details = SellDetails::where('sell_id','=',$id)->get();

            foreach ($details as $key => $value) {
               
               $stock = Stock::find($value->stock_id);

               $stock->current_quantity = $stock->current_quantity+$value->sold_quantity;

               $stock->update();

             }
          
             SellDetails::where('sell_id','=',$id)->delete();
             //delete payment

            Payment::where('sell_id','=',$id)->delete();

            DB::commit();

           return response()->json(['status' => 'success', 'message' => '¡Factura eliminada!']);
  
        }
        catch(\Exception $e){
             
             DB::rollback();

             return $e;
             return response()->json(['status'=>'error','message'=>'¡Algo salió mal!']);
        }

    }
}
