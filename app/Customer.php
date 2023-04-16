<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Customer extends Model
{
   // relation with sell 

	public function sell(){
       
       return $this->hasMany('App\Sell');
	}


	public function sell_details(){

		return $this->hasMany('App\SellDetails');
	}
}
