<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use Notifiable;




    // realtion with Stock


    public function stock(){
       
       return $this->hasMany('App\Stock');

    }
   
    // relationt with sell
    public function Sell(){

        return $this->hasMany('App\Sell');
    } 

    // relation with payment 


    public function payment(){

        return $this->hasMany('App\Payment');
    }


    public function sell_details(){

        return $this->hasMany('App\SellDetails');
    }


    // relation with role 

    public function role(){
      
      return $this->belongsTo('App\Role')->withDefault([
        'id' => 0,
        'role_name' => 'Guest Role',
    ]);

    }

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];
}
