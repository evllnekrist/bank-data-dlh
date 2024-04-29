<?php
namespace App\Traits;
use App\Models\Log;

trait PushLog
{
    private $to_json_encode = array('array','object');

    public function LogRequest($subject, $request, $response){
        // dd(
        Log::create(
          array(
            'subject' => $subject,
            'request' => in_array(gettype($request),$this->to_json_encode)?json_encode($request->all()):$request,
            'response' => in_array(gettype($response),$this->to_json_encode)?json_encode($response):$response,
            'created_by' => \Auth::user()->id,
            'created_at' => date("Y-m-d H:i:s")
          )
        );
      }
}
