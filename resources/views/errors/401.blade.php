@extends('layouts.app-enigma')
@section('title', 'Kelola Berkas')
@section('content')
    @php
        $collection = array('401_burung.png','401_plang.png','401_bawahlaut.png');
        $random_key = array_rand($collection,1); 
        
    @endphp
    <div class="mt-10">	
        <center>
            <img src="{{asset('img/'.$collection[$random_key])}}" class="img-fluid" style="height:40vh" alt="">
            <h1 class="text-lg font-medium mt-10">{{@$title}}</h1>
            <p class="text-xs">
                {{@$desc}}<br>
                <a href="{{route('file-manager')}}">Kembali ke <u class="text-primary"><b>laman utama</b></u></a>
            </p>
        </center>
	</div>
@endsection
@section('addition_script')
@endsection