<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Session;
use Validator;
use Auth;

class UserController extends Controller
{
    


 public function logout(){
   
   Auth::logout();
   Session::forget('side_menu');
   return redirect('/');

 }

}
