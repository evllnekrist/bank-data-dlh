<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class DynamicInputController extends Controller
{
    public function index()
    {
      return view('pages.dynamic-input.index');
    }
    public function form_add()
    {
      return view('pages.dynamic-input.add');
    }
    public function form_edit($id)
    {
      $data['selected'] = DynamicInput::find($id);
      if($data['selected']){
        return view('pages.dynamic-input.edit', $data);
      }else{
        return $this->show_error_page('input Dinamis');
      }
    }

    // -------------------------------------- CALLED BY AJAX ---------------------------- start
      public function get_list(Request $request)
      {
        $filter['equal']  = ['type_of_file'];
        // $filter['search'] = [];
        $request->request->add(['_dir' => array('id'=>'ASC')]); 
        return $this->get_list_common($request, 'DynamicInput', $filter, []);
      }
      public function post_delete($id)
      {
          // $items =  User::where('user_group_id',$id)->get()->toArray();
          // dd(!empty($items));
          try {
            // check if there user related to the particular group
            $items =  User::where('user_group_id',$id)->get()->toArray();
            if(!empty($items)){
              return json_encode(array('status'=>false, 'message'=>'Ada user yang berhubungan dengan satuan kerja ini. Hapus dahulu akun yang terkait jika ingin menghilangkan satker, atau cukup nonaktifkan satker lewat menu edit', 'data'=>$items));
            }
            $output = DynamicInput::where('id', $id)->delete();
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
            $output = DynamicInput::create($data); $output2 = null;
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
              $output2 = DynamicInput::where('id',$output->id)->update($data);
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
          // dd($request->all());
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
            $id = $data['id']; unset($data['id']);
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
            $output = DynamicInput::where('id',$id)->update($data);
            DB::commit();
            return json_encode(array('status'=>true, 'message'=>'Berhasil mengubah data', 'data'=>array('output'=>$output,'data'=>$data,'id'=>$id)));
          } catch (Exception $e) {
            DB::rollback();
            return json_encode(array('status'=>false, 'message'=>$e->getMessage(), 'data'=>null));
          }
      }
    // -------------------------------------- CALLED BY AJAX ---------------------------- end
}
