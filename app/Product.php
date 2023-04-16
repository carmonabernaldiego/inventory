<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{


  // realtion with category 

  
  public function category(){

  	return $this->belongsTo('App\Category')->withDefault([
        'id' => 0,
        'name' => 'unknow category',

    ]);
  } 	
     
   // realtion with stock 

   public function stock(){

     
     return $this->hasMany('App\Stock');  

   }

   // relation with sell details 


   public function sell_details(){
         
        return $this->hasMany('App\SellDetails');

   }


}
