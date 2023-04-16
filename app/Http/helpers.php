<?php
use Illuminate\Support\Facades\DB;


function sideMenu($role_id){

 
           $parent =  DB::table('menus')
            ->select(DB::raw('menus.id, menus.name, menus.menu_url, menus.parent_id, menus.icon'))
            ->join('permissions', 'permissions.menu_id', '=', 'menus.id')
            ->where('permissions.role_id',$role_id)
            ->orderBy('menus.id','ASC')
            ->where('menus.parent_id',0)
            ->get();
            
            $sidmenu = [];
            foreach ($parent as  $value) {  
            $menus = [];   
            $menus['id'] = $value->id;
            $menus['name'] = $value->name;
            $menus['url'] = $value->menu_url;
            $menus['icon'] = $value->icon;
            $menus['parent_id'] = $value->parent_id;


            if($value->menu_url != null){
              
             $menus['sub_menu'] = []; 
            }
            else{
              
            $menus['sub_menu'] = subMenu($role_id,$value->id);

            }

            array_push($sidmenu, $menus);
            
            }

         return $sidmenu;   

}


function subMenu($role_id,$id){

	      return DB::table('menus')
            ->select(DB::raw('menus.id, menus.name, menus.menu_url, menus.parent_id, menus.icon'))
            ->join('permissions', 'permissions.menu_id', '=', 'menus.id')
            ->where('permissions.role_id',$role_id)
            ->where('menus.parent_id','=',$id)
            ->orderBy('id','ASC')
            ->get()->toArray();
}

function makeNested($source) {
      $menu = array();

      $sub_menu = array();

      $new_menu = [];

      foreach ( $source as &$s ) {
            if ( $s['parent_id'] == 0 ) {
                  // no parent_id so we put it in the root of the array
                  $menu[] = &$s;
            }  

            if ( $s['parent_id'] != 0 ) {
                  // it have  parent id so making child id
                  $sub_menu[] = &$s;
            }

      }

     // in this loop we are puting child into there parent 
      foreach ($menu as $key => $value) {
             $value['sub_menu'] = [];
             foreach ($sub_menu as $sk => $sub) {
            
                if ($value['id']==$sub['parent_id']){   
                   
                   array_push($value['sub_menu'],$sub);
                  }  

             }

             array_push($new_menu,$value);
      }

      return $new_menu;
}
?>