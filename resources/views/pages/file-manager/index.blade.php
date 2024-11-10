@extends('layouts.app-enigma')
@section('title', 'Kelola Berkas')
@section('content')
<div class="mt-8 grid grid-cols-12 gap-6">
    <div class="col-span-12 lg:col-span-3 2xl:col-span-2">
        @include('components.enigma.file-manager-filter-side')
    </div>
    <div class="col-span-12 lg:col-span-9 2xl:col-span-10">
        @include('components.enigma.file-manager-filter-top')
        <div class="mx-auto hidden text-slate-500 md:block">
            <center>
                 Menampilkan <span id="products_count_start"></span> - <span id="products_count_end"></span> dari <span id="products_count_total"></span> data<br>
                 <span id="products_search_info"></span>
                 <input name="_page" value="1" class="_filter" hidden>
             </center>
        </div>
        <!-- BEGIN: Directory & Files -->
        <div class="intro-y mt-5 grid grid-cols-4 gap-4" id="data-list">
            <div class="col-span-12"><img src="{{asset('img/loading.gif')}}" class="mx-auto"></div>
        </div>
        <!-- END: Directory & Files -->
        <!-- BEGIN: Pagination -->
        <div class="intro-y mt-6 flex flex-wrap items-center sm:flex-row sm:flex-nowrap">
            <nav class="w-full sm:mr-auto sm:w-auto">
                <ul class="flex w-full mr-0 sm:mr-auto sm:w-auto" id="data-list-pagination"></ul>
            </nav>
            <select name="_limit" onchange="getData()" data-tw-merge="" class="_filter disabled:bg-slate-100 disabled:cursor-not-allowed disabled:dark:bg-darkmode-800/50 [&[readonly]]:bg-slate-100 [&[readonly]]:cursor-not-allowed [&[readonly]]:dark:bg-darkmode-800/50 transition duration-200 ease-in-out text-sm border-slate-200 shadow-sm rounded-md py-2 px-3 pr-8 focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus:border-primary focus:border-opacity-40 dark:bg-darkmode-800 dark:border-transparent dark:focus:ring-slate-700 dark:focus:ring-opacity-50 group-[.form-inline]:flex-1 !box mt-3 w-20 sm:mt-0">    
                <option value="8">8</option>
                <option value="16">16</option>
                <option value="40">40</option>
                <option value="120">120</option>
                <option value="240">240</option>
            </select>
        </div>
        <!-- END: Pagination -->
    </div>
</div>
@endsection
@section('addition_css')
    <link rel="stylesheet" href="{{ asset('dist/css/vendors/zoom-vanilla.css') }}">
@endsection
@section('addition_script')
    <script src="{{ asset('dist/js/vendors/image-zoom.js') }}"></script>
    <script src="{{ asset('page/js/file-manager-index.js').'?v='.date('YmdH').'2' }}"></script>
@endsection