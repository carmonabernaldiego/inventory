<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Sell;
use App\SellDetails;
use App\Product;
use App\Stock;
use App\Category;
use App\Vendor;
use App\Customer;

class DashboardController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        return view('welcome');
    }


    public function InfoBox()
    {

        $total_invoice = Sell::count();
        $total_customer = Customer::count();
        $total_vendor = Vendor::count();
        $total_sold_amount = Sell::sum('total_amount');
        $total_paid_amount = Sell::sum('paid_amount');
        $total_outstanding = $total_sold_amount - $total_paid_amount;
        $total_product = Product::count();
        $total_quantity = Stock::sum('stock_quantity');
        $total_sold_quantity = SellDetails::sum('sold_quantity');
        $total_current_quantity = $total_quantity - $total_sold_quantity;

        $total_buy_price = SellDetails::sum('total_buy_price');
        $total_gross_profit = $total_sold_amount - $total_buy_price;
        $total_net_profit = $total_paid_amount - $total_buy_price;

        return response()->json([

            'total_invoice' => $total_invoice,
            'total_customer' => $total_customer,
            'total_vendor' => $total_vendor,
            'total_sold_amount' => round($total_sold_amount),
            'total_paid_amount' => round($total_paid_amount),
            'total_outstanding' => round($total_outstanding),
            'total_product' => $total_product,
            'total_quantity' => $total_quantity,
            'total_sold_quantity' => $total_sold_quantity,
            'total_current_quantity' => $total_current_quantity,
            'total_gross_profit' => round($total_gross_profit),
            'total_net_profit' => round($total_net_profit)

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
        //
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
