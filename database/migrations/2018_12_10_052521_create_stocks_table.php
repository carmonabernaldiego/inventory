 <?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateStocksTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('stocks', function (Blueprint $table) {
            $table->increments('id');
            $table->string('product_code');
            $table->integer('product_id');
            $table->integer('category_id');
            $table->integer('vendor_id');
            $table->integer('user_id');
            $table->string('chalan_no');
            $table->double('buying_price');
            $table->double('selling_price');
            $table->double('discount')->default(0);
            $table->integer('stock_quantity');
            $table->integer('current_quantity')->default(0);
            $table->text('note')->nullable();
            $table->tinyInteger('status')->default(1);
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
        Schema::dropIfExists('stocks');
    }
}
