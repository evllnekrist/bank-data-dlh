<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Http\Request;

class Controller extends BaseController
{
    use AuthorizesRequests, ValidatesRequests;

    
    public function get_list_common(Request $request, $model, $filter, $with){
        try {
          $data['filter']       = $request->all();
          $model                = 'App\Models\\'.$model;
          $page                 = $data['filter']['_page']  = (@$data['filter']['_page'] ? intval($data['filter']['_page']) : 1);
          $limit                = $data['filter']['_limit'] = (@$data['filter']['_limit'] ? intval($data['filter']['_limit']) : 1000);
          $offset               = ($page?($page-1)*$limit:0);
          $data['products']     = $model::with($with);
          
          if(!empty($filter)){ // check if there is filter/s
            if(isset($filter['equal'])){ // for the case of equal value
              foreach ($filter['equal'] as $key => $value) { // loop of the same case
                if(isset($data['filter']['_'.$value]) && $data['filter']['_'.$value]!="all"){ // check if filter have value
                    $data['products'] = $data['products']->where($value,'=',$data['filter']['_'.$value]);
                }
              }
            }
            if(isset($filter['search'])){
                if(isset($data['filter']['_search'])){
                    $query = "(";
                    for ($i=0; $i < sizeof($filter['search']); $i++) { 
                        $query .= "LOWER(".($filter['search'][$i]).") LIKE '%".strtolower($data['filter']['_search'])."%'";
                        if($i+1 < sizeof($filter['search'])){
                            $query .= " or ";
                        }
                    }
                    $query .= ')';
                    $data['products'] = $data['products']->whereRaw($query);
                }
            }
            if(!empty($data['filter']['_dir'])){
              foreach ($data['filter']['_dir'] as $key => $value) {
                if($value){
                  $data['products'] = $data['products']->orderBy($key,$value);
                }
              }
            }else{
              $data['products'] = $data['products']->orderBy('id','desc');
            }
          }
        
          $data['products_count_total']   = $data['products']->count();
          $data['products']               = ($limit==0 && $offset==0)?$data['products']:$data['products']->limit($limit)->offset($offset);
          $data['products_raw_sql']       = $data['products']->toSql();
          $data['products']               = $data['products']->get();
          $data['products_count_start']   = ($data['products_count_total'] == 0 ? 0 : (($page-1)*$limit)+1);
          $data['products_count_end']     = ($data['products_count_total'] == 0 ? 0 : (($page-1)*$limit)+sizeof($data['products']));
          return json_encode(array('status'=>true, 'message'=>'Berhasil mengambil data', 'data'=>$data));
        } catch (Exception $e) {
          return json_encode(array('status'=>false, 'message'=>$e->getMessage(), 'data'=>null));
        }
      }
}
