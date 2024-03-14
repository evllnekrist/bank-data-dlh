<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\UserGroup;
use DB;

class UserGroupController extends Controller
{
    public function index()
    {
      return view('pages.user-group.index');
    }
    public function form_add()
    {
      return view('pages.user-group.add');
    }
    public function form_edit($id)
    {
      $data['selected'] = UserGroup::find($id);
      if($data['selected']){
        return view('pages.user-group.edit', $data);
      }else{
        return $this->show_error_admin('Dokumen Hukum');
      }
    }
    public function format_filename(Request $request){
      // $data = $request->all(); 
      // return $data['year'].$data['legal_product_type'].'6206'.sprintf( '%03d', $data['number']).'.'.$extension;
    }

    // -------------------------------------- CALLED BY AJAX ---------------------------- start
      public function get_list(Request $request)
      {
        // $filter['equal']  = [];
        $filter['search'] = ['nickname','fullname'];
        return $this->get_list_common($request, 'UserGroup', $filter, []);
      }
      public function post_delete($id)
      {
          try {
            // check if there user related to the particular group
            $exist =  User::where('user_group_id',$id)->get();
            if($exist){
              return json_encode(array('status'=>false, 'message'=>'Ada user yang berhubungan dengan satuan kerja ini. Hapus dahulu akun yang terkait jika ingin menghilangkan satker, atau cukup nonaktifkan satker lewat menu edit', 'data'=>$exist));
            }
            $output = UserGroup::where('id', $id)->delete();
            return json_encode(array('status'=>true, 'message'=>'Berhasil menghapus data', 'data'=>$output));
          } catch (Exception $e) {
            return json_encode(array('status'=>false, 'message'=>$e->getMessage(), 'data'=>null));
          }
      }
      public function post_add(Request $request)
      {
          $validator = Validator::make($request->all(), [
            'fullname'  => 'required',
            'nickname'  => 'required',
            'email'     => 'required',
            'phone'     => 'required',
          ]); 
          if ($validator->fails()) {
            // return redirect()->back()->withInput();
            return json_encode(array('status'=>false, 'message'=>$validator->messages()->first(), 'data'=>null));
          }
    
          DB::beginTransaction();
          try {
            $data = $request->all(); 
            $default_folder = 'user-group/'; 
            $output = UserGroup::create($data);
            $file_indexes = array('img_main');
            foreach ($file_indexes as $index){ // https://laracasts.com/discuss/channels/laravel/how-direct-upload-file-in-storage-folder
              if($request->file($index)){
                // Get filename with the extension
                $filename_with_ext = $request->file($index)->getClientOriginalName();
                //Get just filename
                $filename = pathinfo($filename_with_ext, PATHINFO_FILENAME);
                // Get just ext
                $extension = $request->file($index)->getClientOriginalExtension();
                // Filename to store
                // $filename_to_store = $index.'_'.time().'.'.$extension; // V1
                $filename_to_store = $this->format_filename($request); // V2
                // Upload Image
                $path = $request->file($index)->storeAs('public/'.$default_folder.($index=='file_main'?'file':'image'),$filename_to_store);
                $data[$index] = '/storage//'.$default_folder.($index=='file_main'?'file':'image')."//".$filename_to_store;
              }else{
                unset($data[$index]);
              }
            }
            $output2 = UserGroup::where('id',$output->id)->update($data);
            DB::commit();
            return json_encode(array('status'=>true, 'message'=>'Berhasil menyimpan data', 'data'=>array('output'=>$output,'output_img'=>$output2), 'statistics_update'=>$output2));
          } catch (Exception $e) {
            DB::rollback();
            return json_encode(array('status'=>false, 'message'=>$e->getMessage(), 'data'=>null));
          }
      }
      public function post_edit(Request $request)
      {
          $validator = Validator::make($request->all(), [
            'fullname'  => 'required',
            'nickname'  => 'required',
            'email'     => 'required',
            'phone'     => 'required',
          ]); 
          if ($validator->fails()) {
            // return redirect()->back()->withInput();
            return json_encode(array('status'=>false, 'message'=>$validator->messages()->first(), 'data'=>null));
          }
          
          DB::beginTransaction();
          try {
            $data = $request->all();
            $default_folder = 'user-group/'; 
            $file_indexes = array('img_main');
            foreach ($file_indexes as $index){ // https://laracasts.com/discuss/channels/laravel/how-direct-upload-file-in-storage-folder
              if($request->file($index)){
                // Get filename with the extension
                $filename_with_ext = $request->file($index)->getClientOriginalName();
                //Get just filename
                $filename = pathinfo($filename_with_ext, PATHINFO_FILENAME);
                // Get just ext
                $extension = $request->file($index)->getClientOriginalExtension();
                // Filename to store
                $filename_to_store = $index.'_'.time().'.'.$extension;
                // Upload Image
                $path = $request->file($index)->storeAs('public/'.$default_folder.($index=='file_main'?'file':'image'),$filename_to_store);
                $data[$index] = '/storage//'.$default_folder.($index=='file_main'?'file':'image')."//".$filename_to_store;
              }else{
                unset($data[$index]);
              }
            }
            unset($data['id']);
            if(isset($data['files'])){
              unset($data['files']);
            }
            $output                         = UserGroup::where('id',$request->get('id'))->update($data);
            DB::commit();
            return json_encode(array('status'=>true, 'message'=>'Berhasil menrubah data', 'data'=>$output));
          } catch (Exception $e) {
            DB::rollback();
            return json_encode(array('status'=>false, 'message'=>$e->getMessage(), 'data'=>null));
          }
      }
    // -------------------------------------- CALLED BY AJAX ---------------------------- end
}
