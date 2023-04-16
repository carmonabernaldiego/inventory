<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateSellDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('sell_details', function (Blueprint $table) {
           $table->increments('id');
            $table->integer('stock_id');
            $table->integer('sell_id');
            $table->integer('product_id');
            $table->integer('category_id');
            $table->integer('vendor_id');
            $table->integer('user_id');
            $table->string('chalan_no');
            $table->string('selling_date');
            $table->string('customer_id');
            $table->integer('sold_quantity');
            $table->double('buy_price');
            $table->double('sold_price');
            $table->double('total_buy_price')->comments = 'sold_qty * buy_price';
            $table->double('total_sold_price')->comments = 'sold_qty * sold_price';
            $table->double('discount');
            $table->tinyInteger('discount_type')->comments = "1 = amount , 2 = percent";
            $table->double('discount_amount');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('sell_details');
    }
}
