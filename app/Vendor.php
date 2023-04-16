<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Vendor extends Model
{
    // realtion with stock 


    public function stock(){

    return $this->hasMany('App\Stock');
    }
}
