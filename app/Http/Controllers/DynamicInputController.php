<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use App\Traits\PushLog;
use App\Models\DynamicInput;
use App\Models\Option;
use DB;

class DynamicInputController extends Controller
{
    use PushLog;
    private $readable_name    = 'Input Dinamis'; 

    public function index()
    {
      return view('pages.dynamic-input.index');
    }
    public function form_add($type)
    {
      $data['selected_tof'] = $type;
      $data['file_types'] = Option::where('type','TYPE_OF_FILE')->get();
      $data['input_types'] = Option::where('type','TYPE_OF_INPUT')->get();
      $data['input_behavior'] = array();
      foreach ($data['input_types'] as $key => $value) {
        // echo 'BEHAVIOR_OF_INPUT_'.strtoupper($value->value).'<br>';
        $data['input_behavior'][$value->value] = Option::where('type','BEHAVIOR_OF_INPUT_'.strtoupper($value->value))->get();
      }
      // dd($data);
      return view('pages.dynamic-input.add',$data);
    }
    public function form_edit($id)
    {
      $data['selected'] = DynamicInput::find($id);
      if($data['selected']){
        $data['file_types'] = Option::where('type','TYPE_OF_FILE')->get();
        $data['input_types'] = Option::where('type','TYPE_OF_INPUT')->get();
        $data['input_behavior'] = array();
        if($data['selected']['type_of_input']){
          $data['input_behavior']['selected'] = Option::where('type','BEHAVIOR_OF_INPUT_'.strtoupper($data['selected']['type_of_input']))->get();
        }
        foreach ($data['input_types'] as $key => $value) {
          $data['input_behavior'][$value->value] = Option::where('type','BEHAVIOR_OF_INPUT_'.strtoupper($value->value))->get();
        }
        return view('pages.dynamic-input.edit', $data);
      }else{
        return $this->show_error_404('input Dinamis');
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
          try {
            $output2 = DynamicInput::where('id', $id)->update(['deleted_by'    => \Auth::check()?\Auth::user()->id:null]);
            $output = DynamicInput::where('id', $id)->delete();
            $output_final = array('status'=>true, 'message'=>'Berhasil menghapus data', 'data'=>$output);
          } catch (Exception $e) {
            $output_final = array('status'=>false, 'message'=>$e->getMessage(), 'data'=>null);
          }
          $this->LogRequest('Hapus '.$this->readable_name,$id,$output_final);
          return json_encode($output_final);
      }
      public function post_add(Request $request)
      {
          $validator = Validator::make($request->all(), [
            'type_of_file'  => 'required',
            'type_of_input' => 'required',
            'name'          => 'required',
            'label'         => 'required',
          ]); 
          if ($validator->fails()) {
            // return redirect()->back()->withInput();
            $output_final = array('status'=>false, 'message'=>$validator->messages()->first(), 'data'=>null);
          }

          DB::beginTransaction();
          try {
            $data = $request->all(); 
            if(isset($data['behavior'])){
              $data['behavior'] = implode(',',$data['behavior']);
            }
            $data['created_by'] = \Auth::check()?\Auth::user()->id:null;
            $output = DynamicInput::create($data);
            DB::commit();
            $output_final = array('status'=>true, 'message'=>'Berhasil menyimpan data', 'data'=>array('output'=>$output));
          } catch (Exception $e) {
            DB::rollback();
            $output_final = array('status'=>false, 'message'=>$e->getMessage(), 'data'=>null);
          }
          $this->LogRequest('Tambah '.$this->readable_name,$request,$output_final);
          return $output_final;
      }
      public function post_edit(Request $request)
      {
          // dd($request->all());
          $validator = Validator::make($request->all(), [
            'type_of_file'  => 'required',
            'type_of_input' => 'required',
            // 'name'          => 'required', // not supposed to be changed, will affect file data readable
            'label'         => 'required',
          ]); 
          if ($validator->fails()) {
            // return redirect()->back()->withInput();
            $output_final = array('status'=>false, 'message'=>$validator->messages()->first(), 'data'=>null);
          }
          
          DB::beginTransaction();
          try {
            $data = $request->all();
            $id = $data['id']; unset($data['id']);
            if(isset($data['behavior'])){
              $data['behavior'] = implode(',',$data['behavior']);
            }
            $data['updated_by'] = \Auth::check()?\Auth::user()->id:null;
            $output = DynamicInput::where('id',$id)->update($data);
            DB::commit();
            $output_final = array('status'=>true, 'message'=>'Berhasil mengubah data', 'data'=>array('output'=>$output,'data'=>$data,'id'=>$id));
          } catch (Exception $e) {
            DB::rollback();
            $output_final = array('status'=>false, 'message'=>$e->getMessage(), 'data'=>null);
          }
          $this->LogRequest('Edit '.$this->readable_name,$request,$output_final);
          return json_encode($output_final);
      }
    // -------------------------------------- CALLED BY AJAX ---------------------------- end
}
