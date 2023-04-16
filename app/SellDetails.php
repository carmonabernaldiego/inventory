<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class SellDetails extends Model
{
   
   // relation with stock 


	public function stock(){

		return $this->belongsTo('App\Stock','stock_id');
	}

	public function product(){

		return $this->belongsTo('App\Product');
	}


	public function customer(){

		return $this->belongsTo('App\Customer');
	}


	public function user(){

		return $this->belongsTo('App\User')->withDefault([
			'id' => 0,
			'name' => 'Unknown User'
		  ]);
	}



}
