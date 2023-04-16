<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Stock extends Model
{
    
    // relation with product 
    public function product(){

        return $this->belongsTo('App\Product');
    } 


    public function category(){

    	return $this->belongsTo('App\Category');
    }

    // relation with user 


    public function user(){

    	return $this->belongsTo('App\User')->withDefault([
          'id' => 0,
          'name' => 'Unknown User'
        ]);
    }

    // realtion with vendor 

    public function vendor(){

    	return $this->belongsTo('App\Vendor');
    }

    // relation with sell_details 


    public function sell_details(){

        return $this->hasMany('App\SellDetails','stock_id');
    }
}
