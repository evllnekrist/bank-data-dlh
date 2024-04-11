<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use App\Models\File;
// use App\Models\DynamicInput;
use App\Models\Usergroup;
use App\Models\Option;
use App\Models\Keyword;
use DB;

class FileManagerController extends Controller
{
    private $default_folder = 'file-manager/';
    private $file_indexes = array('file_main');
    
    public function index()
    {
      return view('pages.file-manager.index');
    }
    public function form_add()
    {
      $data['user_groups'] = UserGroup::orderBy('id','desc')->get();
      $data['keywords'] = Keyword::orderBy('subject','asc')->get();
      $data['editorial_permissions'] = Option::where('type','EDITORIAL_PERMISSION')->get();
      $data['file_types'] = Option::where('type','TYPE_OF_FILE')->get();
      $data['publicity_types'] = Option::where('type','TYPE_OF_PUBLICITY')->get();
      return view('pages.file-manager.add',$data);
    }
    public function form_edit($id)
    {
      // $request = new Request;
      // $dynamic_inputs = json_decode(app('App\Http\Controllers\DynamicInputController')->get_list($request));
      // $data['dynamic_inputs'] = $dynamic_inputs->data->products;
      // dump($data); die();
      $data['selected'] = File::find($id);
      if($data['selected']){
        $data['user_groups'] = UserGroup::orderBy('id','desc')->get();
        $data['keywords'] = Keyword::orderBy('subject','asc')->get();
        $data['editorial_permissions'] = Option::where('type','EDITORIAL_PERMISSION')->get();
        $data['file_types'] = Option::where('type','TYPE_OF_FILE')->get();
        $data['publicity_types'] = Option::where('type','TYPE_OF_PUBLICITY')->get();
        return view('pages.file-manager.edit', $data);
      }else{
        return $this->show_error_page('Berkas');
      }
    }

    // -------------------------------------- CALLED BY AJAX ---------------------------- start
      public function get_list(Request $request)
      {
        // $filter['equal']  = [];
        $filter['search'] = ['title'];
        return $this->get_list_common($request, 'File', $filter, ['owner_user_group']);
      }
      public function post_delete($id)
      {
          try {
            // check if ...
            $output = File::where('id', $id)->delete();
            return json_encode(array('status'=>true, 'message'=>'Berhasil menghapus data', 'data'=>$output));
          } catch (Exception $e) {
            return json_encode(array('status'=>false, 'message'=>$e->getMessage(), 'data'=>null));
          }
      }
      public function post_add(Request $request)
      {
          // dump($request->all());
          $validator = Validator::make($request->all(), [
            'title'  => 'required',
            'user_group_id'  => 'required',
            'type_of_file'  => 'required',
            'type_of_publicity'  => 'required',
            // 'type_of_extension'  => 'required', // setup by system
            'editorial_permission'  => 'required',
          ]); 
          if ($validator->fails()) {
            // return redirect()->back()->withInput();
            return json_encode(array('status'=>false, 'message'=>$validator->messages()->first(), 'data'=>null));
          }
    
          DB::beginTransaction();
          try {
            $data = $request->all(); 
            $output = File::create(array_diff_key($data, array_flip(['dynamic_inputs','keywords'])));
            $this->file_indexes = array_merge($this->file_indexes,explode(',',$data['file_indexes2'])); unset($data['file_indexes2']);
            if(!empty($this->file_indexes)){
              foreach($this->file_indexes as $index_key => $index){ // https://laracasts.com/discuss/channels/laravel/how-direct-upload-file-in-storage-folder
                // echo "(".$index_key.")__________________________________start ";
                // dump($request->file($index));
                // echo "(".$index_key.")__________________________________end ";
                $indexes = explode('.',$index);
                if($request->file($index)){
                  // $filename_with_ext = $request->file($index)->getClientOriginalName(); // Get filename with the extension
                  // $filename = pathinfo($filename_with_ext, PATHINFO_FILENAME); // Get just filename
                  $extension = $request->file($index)->getClientOriginalExtension(); // Get just ext
                  if($index == 'file_main'){
                    $data['type_of_extension'] = $extension;
                  }
                  $filename_to_store = str_replace('/','-',$this->default_folder).$output->id.'-'.$index.'.'.$extension;
                  $path = $request->file($index)->storeAs('public/'.$this->default_folder,$filename_to_store); // Upload Image
                  if(str_contains($index,'.')){
                      $data[$indexes[0]][$indexes[1]] = '/storage//'.$this->default_folder.'/'.$filename_to_store;
                  }else{
                      $data[$index] = '/storage//'.$this->default_folder.'/'.$filename_to_store;
                  }
                }else{
                  if(str_contains($index,'.')){
                      unset($data[$indexes[0]][$indexes[1]]);
                  }else{
                      unset($data[$index]);
                  }
                }
              }
              foreach ($data['keywords'] as $key => $value) {               
                $output3[$key] = Keyword::firstOrCreate(['subject'=>$value]);
              }
              $data['keywords'] = implode(',',$data['keywords']);
              $data['dynamic_inputs'] = json_encode($data['dynamic_inputs']);
              // dd($data);
              $output2 = File::where('id',$output->id)->update($data);
            }
            DB::commit();
            return json_encode(array('status'=>true, 'message'=>'Berhasil menyimpan data', 'data'=>array('output'=>$output,'output_img'=>$output2)));
          } catch (Exception $e) {
            DB::rollback();
            return json_encode(array('status'=>false, 'message'=>$e->getMessage(), 'data'=>null));
          }
      }
      public function post_edit(Request $request)
      {
          // dump($request->all());die();
          $validator = Validator::make($request->all(), [
            'title'  => 'required',
            'user_group_id'  => 'required',
            'type_of_file'  => 'required',
            'type_of_publicity'  => 'required',
            // 'type_of_extension'  => 'required', // setup by system
            'editorial_permission'  => 'required',
          ]); 
          if ($validator->fails()) {
            // return redirect()->back()->withInput();
            return json_encode(array('status'=>false, 'message'=>$validator->messages()->first(), 'data'=>null));
          }
          
          DB::beginTransaction();
          try {
            $data = $request->all();
            $id = $data['id']; unset($data['id']);
            $this->file_indexes = array_merge($this->file_indexes,explode(',',$data['file_indexes2'])); unset($data['file_indexes2']);
            if(!empty($this->file_indexes)){
              foreach($this->file_indexes as $index){ // https://laracasts.com/discuss/channels/laravel/how-direct-upload-file-in-storage-folder
                $indexes = explode('.',$index);
                if($request->file($index)){
                  // $filename_with_ext = $request->file($index)->getClientOriginalName(); // Get filename with the extension
                  // $filename = pathinfo($filename_with_ext, PATHINFO_FILENAME); // Get just filename
                  $extension = $request->file($index)->getClientOriginalExtension(); // Get just ext
                  if($index == 'file_main'){
                    $data['type_of_extension'] = $extension;
                  }
                  $filename_to_store = str_replace('/','-',$this->default_folder).$id.'-'.$index.'.'.$extension;
                  $path = $request->file($index)->storeAs('public/'.$this->default_folder,$filename_to_store); // Upload Image
                  if(str_contains($index,'.')){
                      $data[$indexes[0]][$indexes[1]] = '/storage//'.$this->default_folder.'/'.$filename_to_store;
                  }else{
                      $data[$index] = '/storage//'.$this->default_folder.'/'.$filename_to_store;
                  }
                }else{
                  if(str_contains($index,'.')){
                      unset($data[$indexes[0]][$indexes[1]]);
                  }else{
                      unset($data[$index]);
                  }
                }
              }
            }
            foreach ($data['keywords'] as $key => $value) {               
              $output3[$key] = Keyword::firstOrCreate(['subject'=>$value]);
            }
            $data['keywords'] = implode(',',$data['keywords']);
            $data['dynamic_inputs'] = json_encode($data['dynamic_inputs']);
            $output = File::where('id',$id)->update($data);
            DB::commit();
            return json_encode(array('status'=>true, 'message'=>'Berhasil mengubah data', 'data'=>array('output'=>$output,'data'=>$data,'id'=>$id)));
          } catch (Exception $e) {
            DB::rollback();
            return json_encode(array('status'=>false, 'message'=>$e->getMessage(), 'data'=>null));
          }
      }
    // -------------------------------------- CALLED BY AJAX ---------------------------- end
}
