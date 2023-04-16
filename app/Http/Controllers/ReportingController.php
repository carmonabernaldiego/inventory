<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Category;
use App\Customer;
use App\Payment;
use App\Product;
use App\Sell;
use App\SellDetails;
use App\Stock;
use App\User;
use App\Vendor;
use App\Company;
use DB;
use Auth;

class ReportingController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $customer = Customer::all();
        $category = Category::all();
        $user = User::all();
        $vendor = Vendor::all();

       return view('report.report',[
          'customer'=>$customer,
          'category'=>$category,
          'user'=>$user,
          'vendor'=>$vendor,
      ]);
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
         'type' => 'required',
         'start_date' => 'required',
         'end_date' => 'required',
        ]);

        $type = $request->type;
        $start_date = date("Y-m-d", strtotime($request->start_date));
        $end_date = date("Y-m-d", strtotime($request->end_date));

        $vendor_id = $request->vendor_id;
        $user_id = $request->user_id;
        $customer_id = $request->customer_id;
        $category_id = $request->category_id;
        $product_id = $request->product_id;
        $stock_id = $request->stock_id;




        $page = '';

        if($type == 'sell'){
         
         $data = SellDetails::with([
            'product:id,product_name',
            'customer:id,customer_name',
            'user:id,name'
        ])
         ->whereBetween('selling_date',[$start_date,$end_date]);
         
        if($user_id != ''){
           
         $data->where('user_id','=',$user_id);

         }

        if($customer_id != ''){
           
         $data->where('customer_id','=',$customer_id);

         }


         if($vendor_id != ''){
           
         $data->where('vendor_id','=',$vendor_id);

         } 

         if($category_id != ''){
           
         $data->where('category_id','=',$category_id);

         }  

         if($product_id != ''){
           
         $data->where('product_id','=',$product_id);

         }


         if($stock_id != ''){
           
         $data->where('stock_id','=',$stock_id);

         } 



         $data = $data->get();

         $page = 'report.sell';

        }

        if($type == 'invoice'){
            
            $data = Sell::with(['customer:id,customer_name','user:id,name'])
                          ->whereBetween('sell_date',[$start_date,$end_date]);
                      if($user_id != ''){

                           $data->where('user_id','=',$user_id);

                       }

                       if($customer_id != ''){

                           $data->where('customer_id','=',$customer_id);

                       }



                    $data =  $data->get();

                    $page = 'report.invoice';              

        }

       if($type == 'due'){
          
          $data = Sell::with(['customer:id,customer_name'])
                        ->select('customer_id',
                          DB::raw('SUM(total_amount) as total_amount'),
                          DB::raw('SUM(paid_amount) as paid_amount')
                         )
                        ->where('payment_status','=',0)
                        ->whereBetween('sell_date',[$start_date,$end_date])
                        ->groupBy('customer_id');

                        if($user_id != ''){

                         $data->where('user_id','=',$user_id);

                         }

                        if($customer_id != ''){

                         $data->where('customer_id','=',$customer_id);

                         }


                        $data  = $data->get();

         $page = 'report.due';  
        }

        if($type == 'profit'){
         
         $data = SellDetails::with('product:id,product_name')
                             ->select('product_id',
                             DB::raw('SUM(sold_quantity) as total_quantity'),
                             DB::raw('SUM(total_buy_price) as total_buy_price'),
                             DB::raw('SUM(total_sold_price) as total_sold_price'),
                             DB::raw('SUM(discount_amount) as total_discount_amount')
                             )
                            ->groupBy('product_id')
                            ->whereBetween('selling_date',[$start_date,$end_date]);

                            if($user_id != ''){
           
                            $data->where('user_id','=',$user_id);

                             }

                            if($customer_id != ''){
           
                             $data->where('customer_id','=',$customer_id);

                             }


                             if($vendor_id != ''){
           
                             $data->where('vendor_id','=',$vendor_id);

                             } 

                             if($category_id != ''){
           
                             $data->where('category_id','=',$category_id);

                             }  

                             if($product_id != ''){
           
                             $data->where('product_id','=',$product_id);

                             }


                             if($stock_id != ''){
           
                             $data->where('stock_id','=',$stock_id);

                             } 

                             $data = $data->get();

                             $page = 'report.profit';

        }


        if($type == 'stock'){
          $data = Stock::with(['product:id,product_name','category:id,name','vendor:id,name'])
                            ->withCount([
                           'sell_details AS sold_qty' => function ($query){
                            $query->select(DB::raw("COALESCE(SUM(sold_quantity),0)"));
                             }])
                            ->whereBetween('chalan_no',[$start_date,$end_date]);
                             
                          if($user_id != ''){
           
                            $data->where('user_id','=',$user_id);

                             }

                             if($vendor_id != ''){
           
                             $data->where('vendor_id','=',$vendor_id);

                             } 

                             if($category_id != ''){
           
                             $data->where('category_id','=',$category_id);

                             }  

                             if($product_id != ''){
                         
                             $data->where('product_id','=',$product_id);

                             }

                             $data = $data->get();

                           
                            $page = 'report.stock';


        }

        $company = Company::find(1);

        return view($page,[
            'data'=>$data,
            'start_date'=>$start_date,
            'end_date'=>$end_date,
            'type' => $type,
            'vendor_id' => $vendor_id,
            'customer_id' => $customer_id,
            'category_id' => $category_id,
            'product_id' => $product_id,
            'stock_id' => $stock_id,
            'user_id' => $user_id,
            'company' => $company,
        ]);


    }

    // report printing 


    public function Print(Request $request){

        $type = $request->type;
        $start_date = date("Y-m-d", strtotime($request->start_date));
        $end_date = date("Y-m-d", strtotime($request->end_date));

        $vendor_id = $request->vendor_id;
        $user_id = $request->user_id;
        $customer_id = $request->customer_id;
        $category_id = $request->category_id;
        $product_id = $request->product_id;
        $stock_id = $request->stock_id;

        $page = '';

        if($type == 'sell'){
         
         $data = SellDetails::with([
            'product:id,product_name',
            'customer:id,customer_name',
            'user:id,name'
        ])
         ->whereBetween('selling_date',[$start_date,$end_date]);
         
        if($user_id != ''){
           
         $data->where('user_id','=',$user_id);

         }

        if($customer_id != ''){
           
         $data->where('customer_id','=',$customer_id);

         }


         if($vendor_id != ''){
           
         $data->where('vendor_id','=',$vendor_id);

         } 

         if($category_id != ''){
           
         $data->where('category_id','=',$category_id);

         }  

         if($product_id != ''){
           
         $data->where('product_id','=',$product_id);

         }


         if($stock_id != ''){
           
         $data->where('stock_id','=',$stock_id);

         } 



         $data = $data->get();

         $page = 'report.print.sell';

        }

        if($type == 'invoice'){
            
            $data = Sell::with(['customer:id,customer_name','user:id,name'])
                          ->whereBetween('sell_date',[$start_date,$end_date]);
                      if($user_id != ''){

                           $data->where('user_id','=',$user_id);

                       }

                       if($customer_id != ''){

                           $data->where('customer_id','=',$customer_id);

                       }



                    $data =  $data->get();

                    $page = 'report.print.invoice';              

        }

       if($type == 'due'){
          
          $data = Sell::with(['customer:id,customer_name'])
                        ->select('customer_id',
                          DB::raw('SUM(total_amount) as total_amount'),
                          DB::raw('SUM(paid_amount) as paid_amount')
                         )
                        ->where('payment_status','=',0)
                        ->whereBetween('sell_date',[$start_date,$end_date])
                        ->groupBy('customer_id');

                        if($user_id != ''){

                         $data->where('user_id','=',$user_id);

                         }

                        if($customer_id != ''){

                         $data->where('customer_id','=',$customer_id);

                         }


                        $data  = $data->get();

         $page = 'report.print.due';  
        }

        if($type == 'profit'){
         
         $data = SellDetails::with('product:id,product_name')
                             ->select('product_id',
                             DB::raw('SUM(sold_quantity) as total_quantity'),
                             DB::raw('SUM(total_buy_price) as total_buy_price'),
                             DB::raw('SUM(total_sold_price) as total_sold_price'),
                             DB::raw('SUM(discount_amount) as total_discount_amount')
                             )
                            ->groupBy('product_id')
                            ->whereBetween('selling_date',[$start_date,$end_date]);

                            if($user_id != ''){
           
                            $data->where('user_id','=',$user_id);

                             }

                            if($customer_id != ''){
           
                             $data->where('customer_id','=',$customer_id);

                             }


                             if($vendor_id != ''){
           
                             $data->where('vendor_id','=',$vendor_id);

                             } 

                             if($category_id != ''){
           
                             $data->where('category_id','=',$category_id);

                             }  

                             if($product_id != ''){
           
                             $data->where('product_id','=',$product_id);

                             }


                             if($stock_id != ''){
           
                             $data->where('stock_id','=',$stock_id);

                             } 

                             $data = $data->get();

                             $page = 'report.print.profit';

        }


        if($type == 'stock'){
          $data = Stock::with(['product:id,product_name','category:id,name','vendor:id,name'])
                            ->withCount([
                           'sell_details AS sold_qty' => function ($query){
                            $query->select(DB::raw("COALESCE(SUM(sold_quantity),0)"));
                             }])
                            ->whereBetween('chalan_no',[$start_date,$end_date]);
                             
                          if($user_id != ''){
           
                            $data->where('user_id','=',$user_id);

                             }

                             if($vendor_id != ''){
           
                             $data->where('vendor_id','=',$vendor_id);

                             } 

                             if($category_id != ''){
           
                             $data->where('category_id','=',$category_id);

                             }  

                             if($product_id != ''){
           
                             $data->where('product_id','=',$product_id);

                             }

                             $data = $data->get();

                           
                            $page = 'report.print.stock';


        }

        $company = Company::find(1);

        return view($page,[
            'data'=>$data,
            'start_date'=>$start_date,
            'end_date'=>$end_date,
            'type' => $type,
            'vendor_id' => $vendor_id,
            'customer_id' => $customer_id,
            'category_id' => $category_id,
            'product_id' => $product_id,
            'stock_id' => $stock_id,
            'user_id' => $user_id,
            'company' => $company,
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
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
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
