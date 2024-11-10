@extends('layouts.app-enigma')
@section('title', 'Kelola Berkas')
@section('content')

<div class="mt-8 grid grid-cols-12 gap-6">
    <input id="display-type" value="{{@$display_type}}" hidden>
    <input id="view-level" value="{{@$view_level}}" hidden>
    <input id="type-of-file" value="{{@$type_of_file}}" hidden>
    <input id="year" value="{{@$year}}" hidden>
    <div class="col-span-12 lg:col-span-3 2xl:col-span-2">
        @include('components.enigma.file-manager-filter-side')
    </div>
    <div class="col-span-12 lg:col-span-9 2xl:col-span-10">
        @include('components.enigma.file-manager-filter-top')
        <div class="mx-auto hidden text-slate-500 md:block">
            <center>
                 Menampilkan <span id="products_count_total"></span> data<br>
                 <span id="products_search_info"></span>
                 <input name="_page" value="1" class="_filter" hidden>
             </center>
        </div>
        <!-- BEGIN: Directory & Files -->
        @if(@$type_of_file && @$year)
            <div class="relative mr-auto mt-3 w-full sm:mt-0 sm:w-auto">
                <i data-tw-merge="" data-lucide="search" class="stroke-1.5 absolute inset-y-0 left-0 z-10 my-auto ml-3 h-4 w-4 text-slate-500"></i>
                <input name="_search" data-tw-merge="" type="text" placeholder="Cari dari kumpulan data ini ..." class="_filter disabled:bg-slate-100 disabled:cursor-not-allowed dark:disabled:bg-darkmode-800/50 dark:disabled:border-transparent [&[readonly]]:bg-slate-100 [&[readonly]]:cursor-not-allowed [&[readonly]]:dark:bg-darkmode-800/50 [&[readonly]]:dark:border-transparent transition duration-200 ease-in-out w-full text-sm border-slate-200 shadow-sm rounded-md placeholder:text-slate-400/90 focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus:border-primary focus:border-opacity-40 dark:bg-darkmode-800 dark:border-transparent dark:focus:ring-slate-700 dark:focus:ring-opacity-50 dark:placeholder:text-slate-500/80 group-[.form-inline]:flex-1 group-[.input-group]:rounded-none group-[.input-group]:[&:not(:first-child)]:border-l-transparent group-[.input-group]:first:rounded-l group-[.input-group]:last:rounded-r group-[.input-group]:z-10 !box px-10 sm:w-72">
            </div>
            <div class="mt-5 grid grid-cols-12 gap-6" id="data-list">
                <div class="col-span-12"><img src="{{asset('img/loading.gif')}}" class="mx-auto"></div>
            </div>
        @else
            <div class="intro-y mt-5 grid grid-cols-4 gap-4" id="data-list">
                <div class="col-span-12"><img src="{{asset('img/loading.gif')}}" class="mx-auto"></div>
            </div>
        @endif
        <!-- END: Directory & Files -->
        <!-- BEGIN: Pagination -->
            <!-- no pagination, unlimited -->
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