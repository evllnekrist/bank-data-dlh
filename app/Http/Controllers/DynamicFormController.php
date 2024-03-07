<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class DynamicFormController extends Controller
{
    public function index()
    {
      return view('pages.dynamic-form.index');
    }
}
