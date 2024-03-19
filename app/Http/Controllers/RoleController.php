<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Role;
use App\Models\RolePermission;
use App\Models\Menu;
use DB;

class RoleController extends Controller
{
  private $default_folder = 'role/';
  private $file_indexes = array('');
  
  public function index()
  {
    return view('pages.role.index');
  }
  public function form_add()
  {
    $data['menus'] = Menu::with('menu_action_list')->where('is_menu_with_action', '1')->get();
    return view('pages.role.add', $data);
  }
  public function form_edit($id)
  {
    $data['menus'] = Menu::with('menu_action_list')->where('is_menu_with_action', '1')->get();
    $data['selected'] = Role::find($id);
    $data['selected_menu_actions'] = RolePermission::where('role_id',$id)->pluck('menu_action_id')->toArray();
    if($data['selected']){
      return view('pages.role.edit', $data);
    }else{
      return $this->show_error_page('Dokumen Hukum');
    }
  }

  // -------------------------------------- CALLED BY AJAX ---------------------------- start
    public function get_list(Request $request)
    {
      // $filter['equal']  = [];
      $filter['search'] = ['name'];
      return $this->get_list_common($request, 'Role', $filter, []);
    }
    public function post_delete($id)
    {
        try {
          // check if there user related to the particular group
          $exist =  User::where('role_id',$id)->get();
          if($exist){
            return json_encode(array('status'=>false, 'message'=>'Ada user yang berhubungan dengan peran ini. Ubah dahulu peran akun yang terkait ke peran lain untuk dapat menghapus, atau cukup nonaktifkan peran lewat menu edit', 'data'=>$exist));
          }
          $output = Role::where('id', $id)->delete();
          return json_encode(array('status'=>true, 'message'=>'Berhasil menghapus data', 'data'=>$output));
        } catch (Exception $e) {
          return json_encode(array('status'=>false, 'message'=>$e->getMessage(), 'data'=>null));
        }
    }
    public function post_add(Request $request)
    {
        $validator = Validator::make($request->all(), [
          'name'      => 'required',
          'menu_action'  => 'required',
        ]); 
        if ($validator->fails()) {
          // return redirect()->back()->withInput();
          return json_encode(array('status'=>false, 'message'=>$validator->messages()->first(), 'data'=>null));
        }
  
        DB::beginTransaction();
        try {
          $data = $request->all(); 
          $output = Role::create($data); 
          $output2 = null;
          $menu_actions = $data['menu_action']; unset($data['menu_action']);
          if(!empty($this->file_indexes)){
            foreach($this->file_indexes as $index){ // https://laracasts.com/discuss/channels/laravel/how-direct-upload-file-in-storage-folder
              if($request->file($index)){
                $filename_with_ext = $request->file($index)->getClientOriginalName(); // Get filename with the extension
                $filename = pathinfo($filename_with_ext, PATHINFO_FILENAME); // Get just filename
                $extension = $request->file($index)->getClientOriginalExtension(); // Get just ext
                // $filename_to_store = $index.'_'.time().'.'.$extension; // V1
                // $filename_to_store = $this->format_filename($request); // V2
                $filename_to_store = str_replace('/','-',$this->default_folder).$output->id.'.'.$extension;
                $path = $request->file($index)->storeAs('public/'.$this->default_folder,$filename_to_store); // Upload Image
                $data[$index] = '/storage//'.$this->default_folder.'/'.$filename_to_store;
              }else{
                unset($data[$index]);
              }
            }
            $output2 = Role::where('id',$output->id)->update($data);
          }
          foreach ($menu_actions as $menu_action_id) {
            $output3[$menu_action_id] = RolePermission::create([
                'role_id' => $output->id,
                'menu_action_id' => $menu_action_id,
                'is_enabled' => true,
            ]);
          }
          DB::commit();
          return json_encode(array('status'=>true, 'message'=>'Berhasil menyimpan data', 'data'=>array('output'=>$output,'output_img'=>$output2, 'output_permission'=>$output3)));
        } catch (Exception $e) {
          DB::rollback();
          return json_encode(array('status'=>false, 'message'=>$e->getMessage(), 'data'=>null));
        }
    }
    public function post_edit(Request $request)
    {
        $validator = Validator::make($request->all(), [
          'name'      => 'required',
          'menu_action'  => 'required',
        ]); 
        if ($validator->fails()) {
          // return redirect()->back()->withInput();
          return json_encode(array('status'=>false, 'message'=>$validator->messages()->first(), 'data'=>null));
        }
        
        DB::beginTransaction();
        try {
          $data = $request->all();
          $id = $data['id']; unset($data['id']);
          $menu_actions = $data['menu_action']; unset($data['menu_action']);
          if(!empty($this->file_indexes)){
            foreach($this->file_indexes as $index){ // https://laracasts.com/discuss/channels/laravel/how-direct-upload-file-in-storage-folder
              if($request->file($index)){
                $filename_with_ext = $request->file($index)->getClientOriginalName(); // Get filename with the extension
                $filename = pathinfo($filename_with_ext, PATHINFO_FILENAME); // Get just filename
                $extension = $request->file($index)->getClientOriginalExtension(); // Get just ext
                $extension = $request->file($index)->getClientOriginalExtension();
                // $filename_to_store = $index.'_'.time().'.'.$extension; // V1
                // $filename_to_store = $this->format_filename($request); // V2
                $filename_to_store = str_replace('/','-',$this->default_folder).$id.'.'.$extension;
                $data[$index] = '/storage//'.$this->default_folder.'/'.$filename_to_store;
                if (file_exists('public/'.$data[$index])){
                  @unlink('public/'.$data[$index]);
                }
                $path = $request->file($index)->storeAs('public/'.$this->default_folder,$filename_to_store); // Upload Image
              }else{
                unset($data[$index]);
              }
            }
            if(isset($data['files'])){
              unset($data['files']);
            }
          }
          $output = Role::where('id',$id)->update($data);
          RolePermission::where('role_id',$id)->delete();
          foreach ($menu_actions as $menu_action_id) {
            $output3[$menu_action_id] = RolePermission::create([
                'role_id' => $id,
                'menu_action_id' => $menu_action_id,
                'is_enabled' => true,
            ]);
          }
          DB::commit();
          return json_encode(array('status'=>true, 'message'=>'Berhasil mengubah data', 'data'=>array('output'=>$output,'data'=>$data,'id'=>$id)));
        } catch (Exception $e) {
          DB::rollback();
          return json_encode(array('status'=>false, 'message'=>$e->getMessage(), 'data'=>null));
        }
    }
  // -------------------------------------- CALLED BY AJAX ---------------------------- end
}
