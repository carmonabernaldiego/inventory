<?php

namespace App\Http\Controllers;

use App\Role;
use App\Menu;
use App\Permission;
use DB;
use Auth;
use Session;
use Illuminate\Http\Request;

class RoleController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
       return view('user.role');
    }


    public function RoleList(){

        $role = Role::all();

        return $role;
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {


        $request->validate([
             'role_name' => 'required|unique:roles,role_name' 
        ]);

        $role = new Role;

        $role->role_name = $request->role_name;

        $role->save();

        return response()->json(['status'=>'success','message'=>'Rol creado']); 
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Role  $role
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {

        $menu = Menu::select('id','name','parent_id')->orderBy('parent_id','asc')->get()->toArray(); 
        $permission = Permission::where('role_id','=',$id)->pluck('menu_id')->toArray();


    
         $menus = [];


         foreach($menu as $key => $value) {
             
             if(in_array($value['id'], $permission)){
                
                $value['check'] = true;

             }
             else{

               $value['check'] = false; 
             }




          array_push($menus,$value);


         }
        
        // return menu according herirarcy 

   return  makeNested($menus);
   





    }



    public function Permission(Request $request){

       try{
        
      DB::beginTransaction();
      Permission::where('role_id','=',$request->id)->delete();
      
      // getting only check item from menus 
      // $menus = array_filter($request->menus, function ($var) {
      //     return ($var['check'] == true);
      //    });
      
      // inserting permission to the permission table 
       foreach($request->menus as $key => $value) {
           // when menu have sub menu 
           if(count($value['sub_menu'])>0){
            
             $flag = 0;
         
            foreach ($value['sub_menu'] as  $sub_menu) {
                

                // if child is permited then parent have to permited 
                if($sub_menu['check']==true){
                   
                   $sub = new Permission;

                   $sub->role_id = $request->id;
                   $sub->menu_id = $sub_menu['id'];

                   $sub->save();

                   $flag = 1;

                  }
                 
                }
              
              // flag determine whether  parent will isnert or not insert 
             if($flag == 1){
                   $menu_per = new Permission;
                   $menu_per->role_id = $request->id;
                   $menu_per->menu_id = $value['id'];
                   $menu_per->save();

                   $flag = 0;

                }   


              }
              else{
                
                 if($value['check']==true){
                   
                    $parent_per = new Permission;
                    $parent_per->role_id = $request->id;
                    $parent_per->menu_id = $value['id'];
                    $parent_per->save();
                  }

              }

           }
           
        DB::commit();
       
       if(Auth::user()->role_id == $request->id){

        Session::forget('side_menu');
        $permited_menu = sideMenu(Auth::user()->role_id);
        Session::push('side_menu',$permited_menu);

       }
        

        return response()->json(['status'=>'success','message'=>'New Permission Given']);

       }
       catch(\Exception $e)
       {

        DB::rollBack();
       return response()->json(['status'=>'error','message'=>'¡Algo salió mal!']);



       }

    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Role  $role
     * @return \Illuminate\Http\Response
     */
    public function edit(Role $role)
    {
        return $role;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Role  $role
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request,$id)
    {
          
        $request->validate([
             'role_name' => 'required|unique:roles,role_name' 
        ]);

        try{
        $role = Role::find($id);
        $role->role_name = $request->role_name;

        $role->save();

        return response()->json(['status'=>'success','message'=>'Rol actualizado']);
        }
        catch(\Exception $e)
        {

        return response()->json(['status'=>'error','message'=>'¡Algo salió mal!']);

        }

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Role  $role
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        
        try{

            $role = Role::find($id);

            $role->delete();

            return response()->json(['status'=>'success','Delete Success!']);
        }
        catch(\Exception $e){

            return response()->json(['status'=>'error','¡Algo salió mal!']);
          

        }

    }
 

   // just for testing 
    public function userRole(){
         $role_id = Auth::user()->role_id;

         
         echo "<pre>"; 
         print_r(sideMenu($role_id));

         echo "</pre>";
    }
}
