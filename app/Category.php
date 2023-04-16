<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    

    // relation with product 


    public function product(){

    	return $this->hasMany('App\Product');
    }
}
