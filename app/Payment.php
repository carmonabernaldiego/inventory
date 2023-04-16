<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Payment extends Model
{
    // realtion with customer 


    public function customer(){

    	return $this->belongsTo('App\Customer');
    }

    // relation with user 


    public function user(){
     
        return $this->belongsTo('App\User')->withDefault([
            'id' => 0,
            'name' => 'Unknown User'
          ]);

    }
}
