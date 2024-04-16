@extends('layouts.app-enigma', ['breadcrumbs'=>[['label'=>'Kelola Input'],['label'=>'Data']]])
@section('title', 'Kelola Input')
@section('content')
{{-- <h2 class="intro-y mt-10 text-lg font-medium">Kelola Input</h2> --}}
<style>
    .active-tof, .dark .active-tof{
        background-color: rgb(250, 204, 21);
        color: black;
    }
</style>
<div class="mt-5 box bg-primary p-2">
    <div class="intro-y col-span-12 mt-2 mb-5 flex flex-wrap items-center xl:flex-nowrap">
        <div class="mx-auto hidden text-white xl:block">
            Menampilkan <span id="tof-products_count_start"></span> - <span id="tof-products_count_end"></span> dari <span id="tof-products_count_total"></span> data<br>
            <input name="_tof_page" value="1" class="_tof_filter" hidden>
        </div>
        <div class="mt-3 flex w-full items-center xl:mt-0 xl:w-auto">
            <div class="relative w-56 text-slate-500">
                <input name="_tof_search" data-tw-merge="" type="text" placeholder="Cari..." title="isi kemudian enter untuk melakukan pencarian"  class="_tof_filter disabled:bg-slate-100 disabled:cursor-not-allowed dark:disabled:bg-darkmode-800/50 dark:disabled:border-transparent [&[readonly]]:bg-slate-100 [&[readonly]]:cursor-not-allowed [&[readonly]]:dark:bg-darkmode-800/50 [&[readonly]]:dark:border-transparent transition duration-200 ease-in-out text-sm border-slate-200 shadow-sm rounded-md placeholder:text-slate-300/90 focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus:border-primary focus:border-opacity-40 dark:bg-darkmode-800 dark:border-transparent dark:focus:ring-slate-700 dark:focus:ring-opacity-50 dark:placeholder:text-slate-500/80 group-[.form-inline]:flex-1 group-[.input-group]:rounded-none group-[.input-group]:[&:not(:first-child)]:border-l-transparent group-[.input-group]:first:rounded-l group-[.input-group]:last:rounded-r group-[.input-group]:z-10 !box w-56 pr-10">
                <i onclick="getDataTypeOfFile()" data-tw-merge="" data-lucide="search" class="stroke-1.5 absolute inset-y-0 right-0 my-auto mr-3 h-4 w-4"></i>
            </div>
        </div>
    </div>
    <div class="grid grid-cols-12 gap-5" id="data-list-tof">
        <div class="col-span-12"><img src="{{asset('img/loading-white.gif')}}" class="mx-auto my-10 w-32"></div>
    </div>
</div>
<div class="mt-5" id="data-list-info"></div>
<div class="mt-5 grid grid-cols-12 gap-6" id="data-list-wrap" style="display: none">
    <div class="intro-y col-span-12 mt-2 flex flex-wrap items-center xl:flex-nowrap">
        <div class="mx-auto hidden text-slate-500 xl:block">
            Menampilkan <span id="products_count_total">0</span> data<br>
            <input name="_page" value="1" class="_filter" hidden>
        </div>
        <a onclick="goTo('add')" data-tw-merge="" class="transition duration-200 border shadow-sm inline-flex items-center justify-center py-2 px-3 rounded-md font-medium cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed bg-warning border-warning text-slate-900 dark:border-warning my-2 mr-1 w-40">Tambah Input</a>
        <div data-tw-merge="" data-tw-placement="bottom-end" class="dropdown relative">
            <button data-tw-merge="" data-tw-toggle="dropdown" aria-expanded="false" class="transition duration-200 border shadow-sm inline-flex items-center justify-center py-2 rounded-md font-medium cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed !box px-2">
                <span class="flex h-5 w-5 items-center justify-center">
                    <i data-tw-merge="" data-lucide="plus" class="stroke-1.5 h-4 w-4"></i>
                </span>
            </button>
            <div data-transition="" data-selector=".show" data-enter="transition-all ease-linear duration-150" data-enter-from="absolute !mt-5 invisible opacity-0 translate-y-1" data-enter-to="!mt-1 visible opacity-100 translate-y-0" data-leave="transition-all ease-linear duration-150" data-leave-from="!mt-1 visible opacity-100 translate-y-0" data-leave-to="absolute !mt-5 invisible opacity-0 translate-y-1" class="dropdown-menu absolute z-[9999] hidden">
                <div data-tw-merge="" class="dropdown-content rounded-md border-transparent bg-white p-2 shadow-[0px_3px_10px_#00000017] dark:border-transparent dark:bg-darkmode-600 w-40">
                    <a class="cursor-pointer flex items-center p-2 transition duration-300 ease-in-out rounded-md hover:bg-slate-200/60 dark:bg-darkmode-600 dark:hover:bg-darkmode-400 dropdown-item"><i data-tw-merge="" data-lucide="file-text" class="stroke-1.5 mr-2 h-4 w-4"></i>
                        Export ke
                        Excel</a>
                    <a class="cursor-pointer flex items-center p-2 transition duration-300 ease-in-out rounded-md hover:bg-slate-200/60 dark:bg-darkmode-600 dark:hover:bg-darkmode-400 dropdown-item"><i data-tw-merge="" data-lucide="file-text" class="stroke-1.5 mr-2 h-4 w-4"></i>
                        Export ke
                        PDF</a>
                </div>
            </div>
        </div>
    </div>
    <!-- BEGIN: Data List -->
    <div class="intro-y col-span-12 overflow-auto 2xl:overflow-visible">
        <table data-tw-merge="" class="w-full text-left -mt-2 border-separate border-spacing-y-[10px]">
            <thead data-tw-merge="" class="">
                <tr data-tw-merge="" class="">
                    <th onclick="changeDir('id')" id="th_id" data-dir="" data-tw-merge="" class="_dir font-medium px-5 py-3 dark:border-darkmode-300 whitespace-nowrap border-b-0">
                        <input data-tw-merge="" type="checkbox" class="transition-all duration-100 ease-in-out shadow-sm border-slate-200 cursor-pointer rounded focus:ring-4 focus:ring-offset-0 focus:ring-primary focus:ring-opacity-20 dark:bg-darkmode-800 dark:border-transparent dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&[type='radio']]:checked:bg-primary [&[type='radio']]:checked:border-primary [&[type='radio']]:checked:border-opacity-10 [&[type='checkbox']]:checked:bg-primary [&[type='checkbox']]:checked:border-primary [&[type='checkbox']]:checked:border-opacity-10 [&:disabled:not(:checked)]:bg-slate-100 [&:disabled:not(:checked)]:cursor-not-allowed [&:disabled:not(:checked)]:dark:bg-darkmode-800/50 [&:disabled:checked]:opacity-70 [&:disabled:checked]:cursor-not-allowed [&:disabled:checked]:dark:bg-darkmode-800/50">
                        <span class="ml-2">
                            <i class="fas fa-sort text-slate-300"></i>
                            <i class="fas fa-sort-up text-primary hidden"></i>
                            <i class="fas fa-sort-down text-primary hidden"></i>
                        </span>
                    </th>
                    <th onclick="changeDir('label')" id="th_label" data-dir="" data-tw-merge="" class="_dir font-medium px-5 py-3 dark:border-darkmode-300 whitespace-nowrap border-b-0">
                        LABEL
                        <span class="ml-2">
                            <i class="fas fa-sort text-slate-300"></i>
                            <i class="fas fa-sort-up text-primary hidden"></i>
                            <i class="fas fa-sort-down text-primary hidden"></i>
                        </span>
                    </th>
                    <th onclick="changeDir('type_of_input')" id="th_type_of_input" data-dir="" data-tw-merge="" class="_dir font-medium px-5 py-3 dark:border-darkmode-300 whitespace-nowrap border-b-0 text-center">
                        TIPE INPUT
                        <span class="ml-2">
                            <i class="fas fa-sort text-slate-300"></i>
                            <i class="fas fa-sort-up text-primary hidden"></i>
                            <i class="fas fa-sort-down text-primary hidden"></i>
                        </span>
                    </th>
                    <th onclick="changeDir('is_enabled')" id="th_is_enabled" data-dir="" data-tw-merge="" class="_dir font-medium px-5 py-3 dark:border-darkmode-300 whitespace-nowrap border-b-0 text-center">
                        AKTIF
                        <span class="ml-2">
                            <i class="fas fa-sort text-slate-300"></i>
                            <i class="fas fa-sort-up text-primary hidden"></i>
                            <i class="fas fa-sort-down text-primary hidden"></i>
                        </span>
                    </th>
                    <th onclick="changeDir('is_required')" id="th_is_required" data-dir="" data-tw-merge="" class="_dir font-medium px-5 py-3 dark:border-darkmode-300 whitespace-nowrap border-b-0 text-center">
                        WAJIB
                        <span class="ml-2">
                            <i class="fas fa-sort text-slate-300"></i>
                            <i class="fas fa-sort-up text-primary hidden"></i>
                            <i class="fas fa-sort-down text-primary hidden"></i>
                        </span>
                    </th>
                    <th onclick="changeDir('is_multiple')" id="th_is_multiple" data-dir="" data-tw-merge="" class="_dir font-medium px-5 py-3 dark:border-darkmode-300 whitespace-nowrap border-b-0 text-center">
                        JAWABAN GANDA
                        <span class="ml-2">
                            <i class="fas fa-sort text-slate-300"></i>
                            <i class="fas fa-sort-up text-primary hidden"></i>
                            <i class="fas fa-sort-down text-primary hidden"></i>
                        </span>
                    </th>
                    <th onclick="changeDir('behavior')" id="th_behavior" data-dir="" data-tw-merge="" class="_dir font-medium px-5 py-3 dark:border-darkmode-300 whitespace-nowrap border-b-0 text-center">
                        PERILAKU
                        <span class="ml-2">
                            <i class="fas fa-sort text-slate-300"></i>
                            <i class="fas fa-sort-up text-primary hidden"></i>
                            <i class="fas fa-sort-down text-primary hidden"></i>
                        </span>
                    </th>
                    <th data-tw-merge="" class="font-medium px-5 py-3 dark:border-darkmode-300 whitespace-nowrap border-b-0 text-center">
                        ACTIONS
                    </th>
                </tr>
            </thead>
            <tbody id="data-list">
            </tbody>
        </table>
    </div>
    <!-- END: Data List -->
</div>
<div class="mt-5 border-t" id="data-list-info"></div>
@endsection
@section('addition_css')
@endsection
@section('addition_script')
    <script src="{{ asset('page/js/dynamic-input-index.js').'?v='.date('YmdH').'1' }}"></script>
@endsection