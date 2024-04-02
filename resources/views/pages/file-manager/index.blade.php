@extends('layouts.app-enigma')
@section('title', 'Kelola Berkas')
@section('content')
<div class="mt-8 grid grid-cols-12 gap-6">
    <div class="col-span-12 lg:col-span-3 2xl:col-span-2">
        {{-- <h2 class="intro-y mr-auto mt-2 text-lg font-medium"></h2> --}}
        <!-- BEGIN: File Manager Menu -->
        <div class="intro-y box p-5">
            <div class="mt-1">
                <a class="mt-2 flex items-center rounded-md px-3 py-2" href="">
                    <i class="fas fa-file-pdf"></i>
                    <span class="ml-5">PDF</span>
                </a>
                <a class="mt-2 flex items-center rounded-md px-3 py-2" href="">
                    <i class="fas fa-file-powerpoint"></i>
                    <span class="ml-5">PPT</span>
                </a>
                <a class="mt-2 flex items-center rounded-md px-3 py-2" href="">
                    <i class="fas fa-file-word"></i>
                    <span class="ml-5">Docs</span>
                </a>
                <a class="mt-2 flex items-center rounded-md px-3 py-2" href="">
                    <i class="fas fa-file-excel"></i>
                    <span class="ml-5">Excel</span>
                </a>
                <a class="mt-2 flex items-center rounded-md px-3 py-2" href="">
                    <i class="fas fa-file-image"></i>
                    <span class="ml-5">Gambar</span>
                </a>
            </div>
            <div class="mt-4 border-t border-slate-200 pt-4 dark:border-darkmode-400">
                <a class="mt-2 flex items-center rounded-md px-3 py-2" href="">
                    <div class="mr-3 h-2 w-2 rounded-full bg-success"></div>
                    Publik
                </a>
                <a class="mt-2 flex items-center rounded-md px-3 py-2" href="">
                    <div class="mr-3 h-2 w-2 rounded-full bg-warning"></div>
                    Satuan Kerja
                </a>
                <a class="mt-2 flex items-center rounded-md px-3 py-2" href="">
                    <div class="mr-3 h-2 w-2 rounded-full bg-pending"></div>
                    Privat
                </a>
            </div>
            <div class="mt-4 border-t border-slate-200 pt-4 dark:border-darkmode-400">
                <a class="mt-2 flex items-center rounded-md px-3 py-2" href="">
                    <i data-tw-merge="" data-lucide="plus" class="stroke-1.5 mr-2 h-4 w-4"></i>
                    Tambah Kata Kunci
                </a>
            </div>
        </div>
        <!-- END: File Manager Menu -->
    </div>
    <div class="col-span-12 lg:col-span-9 2xl:col-span-10">
        <!-- BEGIN: File Manager Filter -->
        <div class="intro-y flex flex-col-reverse items-center sm:flex-row">
            <div class="relative mr-auto mt-3 w-full sm:mt-0 sm:w-auto">
                <i data-tw-merge="" data-lucide="search" class="stroke-1.5 absolute inset-y-0 left-0 z-10 my-auto ml-3 h-4 w-4 text-slate-500"></i>
                <input data-tw-merge="" type="text" placeholder="Cari..." class="disabled:bg-slate-100 disabled:cursor-not-allowed dark:disabled:bg-darkmode-800/50 dark:disabled:border-transparent [&[readonly]]:bg-slate-100 [&[readonly]]:cursor-not-allowed [&[readonly]]:dark:bg-darkmode-800/50 [&[readonly]]:dark:border-transparent transition duration-200 ease-in-out w-full text-sm border-slate-200 shadow-sm rounded-md placeholder:text-slate-400/90 focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus:border-primary focus:border-opacity-40 dark:bg-darkmode-800 dark:border-transparent dark:focus:ring-slate-700 dark:focus:ring-opacity-50 dark:placeholder:text-slate-500/80 group-[.form-inline]:flex-1 group-[.input-group]:rounded-none group-[.input-group]:[&:not(:first-child)]:border-l-transparent group-[.input-group]:first:rounded-l group-[.input-group]:last:rounded-r group-[.input-group]:z-10 !box px-10 sm:w-64">
                <div data-tw-merge="" data-tw-placement="bottom-start" class="dropdown absolute inset-y-0 right-0 mr-3 flex items-center"><a data-tw-toggle="dropdown" aria-expanded="false" href="javascript:;" class="cursor-pointer block h-4 w-4" role="button"><i data-tw-merge="" data-lucide="chevron-down" class="stroke-1.5 h-4 w-4 cursor-pointer text-slate-500"></i>
                    </a>
                    <div data-transition="" data-selector=".show" data-enter="transition-all ease-linear duration-150" data-enter-from="absolute !mt-5 invisible opacity-0 translate-y-1" data-enter-to="!mt-1 visible opacity-100 translate-y-0" data-leave="transition-all ease-linear duration-150" data-leave-from="!mt-1 visible opacity-100 translate-y-0" data-leave-to="absolute !mt-5 invisible opacity-0 translate-y-1" class="dropdown-menu absolute z-[9999] hidden">
                        <div data-tw-merge="" class="dropdown-content rounded-md border-transparent bg-white p-2 shadow-[0px_3px_10px_#00000017] dark:border-transparent dark:bg-darkmode-600 -ml-[228px] mt-2.5 w-[478px] pt-2">
                            <div class="grid grid-cols-12 gap-4 gap-y-3 p-3">
                                <div class="col-span-6">
                                    <label data-tw-merge="" for="input-filter-1" class="inline-block mb-2 group-[.form-inline]:mb-2 group-[.form-inline]:sm:mb-0 group-[.form-inline]:sm:mr-5 group-[.form-inline]:sm:text-right text-xs">
                                        Nama Berkas
                                    </label>
                                    <input data-tw-merge="" id="input-filter-1" type="text" placeholder="Type the file name" class="disabled:bg-slate-100 disabled:cursor-not-allowed dark:disabled:bg-darkmode-800/50 dark:disabled:border-transparent [&[readonly]]:bg-slate-100 [&[readonly]]:cursor-not-allowed [&[readonly]]:dark:bg-darkmode-800/50 [&[readonly]]:dark:border-transparent transition duration-200 ease-in-out w-full text-sm border-slate-200 shadow-sm rounded-md placeholder:text-slate-400/90 focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus:border-primary focus:border-opacity-40 dark:bg-darkmode-800 dark:border-transparent dark:focus:ring-slate-700 dark:focus:ring-opacity-50 dark:placeholder:text-slate-500/80 group-[.form-inline]:flex-1 group-[.input-group]:rounded-none group-[.input-group]:[&:not(:first-child)]:border-l-transparent group-[.input-group]:first:rounded-l group-[.input-group]:last:rounded-r group-[.input-group]:z-10 flex-1">
                                </div>
                                <div class="col-span-6">
                                    <label data-tw-merge="" for="input-filter-2" class="inline-block mb-2 group-[.form-inline]:mb-2 group-[.form-inline]:sm:mb-0 group-[.form-inline]:sm:mr-5 group-[.form-inline]:sm:text-right text-xs">
                                        Dibagikan
                                    </label>
                                    <input data-tw-merge="" id="input-filter-2" type="text" placeholder="example@gmail.com" class="disabled:bg-slate-100 disabled:cursor-not-allowed dark:disabled:bg-darkmode-800/50 dark:disabled:border-transparent [&[readonly]]:bg-slate-100 [&[readonly]]:cursor-not-allowed [&[readonly]]:dark:bg-darkmode-800/50 [&[readonly]]:dark:border-transparent transition duration-200 ease-in-out w-full text-sm border-slate-200 shadow-sm rounded-md placeholder:text-slate-400/90 focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus:border-primary focus:border-opacity-40 dark:bg-darkmode-800 dark:border-transparent dark:focus:ring-slate-700 dark:focus:ring-opacity-50 dark:placeholder:text-slate-500/80 group-[.form-inline]:flex-1 group-[.input-group]:rounded-none group-[.input-group]:[&:not(:first-child)]:border-l-transparent group-[.input-group]:first:rounded-l group-[.input-group]:last:rounded-r group-[.input-group]:z-10 flex-1">
                                </div>
                                <div class="col-span-6">
                                    <label data-tw-merge="" for="input-filter-3" class="inline-block mb-2 group-[.form-inline]:mb-2 group-[.form-inline]:sm:mb-0 group-[.form-inline]:sm:mr-5 group-[.form-inline]:sm:text-right text-xs">
                                        Tanggal Ditambahkan
                                    </label>
                                    <input data-tw-merge="" id="input-filter-3" type="text" placeholder="Important Meeting" class="disabled:bg-slate-100 disabled:cursor-not-allowed dark:disabled:bg-darkmode-800/50 dark:disabled:border-transparent [&[readonly]]:bg-slate-100 [&[readonly]]:cursor-not-allowed [&[readonly]]:dark:bg-darkmode-800/50 [&[readonly]]:dark:border-transparent transition duration-200 ease-in-out w-full text-sm border-slate-200 shadow-sm rounded-md placeholder:text-slate-400/90 focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus:border-primary focus:border-opacity-40 dark:bg-darkmode-800 dark:border-transparent dark:focus:ring-slate-700 dark:focus:ring-opacity-50 dark:placeholder:text-slate-500/80 group-[.form-inline]:flex-1 group-[.input-group]:rounded-none group-[.input-group]:[&:not(:first-child)]:border-l-transparent group-[.input-group]:first:rounded-l group-[.input-group]:last:rounded-r group-[.input-group]:z-10 flex-1">
                                </div>
                                <div class="col-span-6">
                                    <label data-tw-merge="" for="input-filter-4" class="inline-block mb-2 group-[.form-inline]:mb-2 group-[.form-inline]:sm:mb-0 group-[.form-inline]:sm:mr-5 group-[.form-inline]:sm:text-right text-xs">
                                        Size
                                    </label>
                                    <select data-tw-merge="" id="input-filter-4" class="disabled:bg-slate-100 disabled:cursor-not-allowed disabled:dark:bg-darkmode-800/50 [&[readonly]]:bg-slate-100 [&[readonly]]:cursor-not-allowed [&[readonly]]:dark:bg-darkmode-800/50 transition duration-200 ease-in-out w-full text-sm border-slate-200 shadow-sm rounded-md py-2 px-3 pr-8 focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus:border-primary focus:border-opacity-40 dark:bg-darkmode-800 dark:border-transparent dark:focus:ring-slate-700 dark:focus:ring-opacity-50 group-[.form-inline]:flex-1 flex-1">
                                        <option>10</option>
                                        <option>25</option>
                                        <option>35</option>
                                        <option>50</option>
                                    </select>
                                </div>
                                <div class="col-span-12 mt-3 flex items-center">
                                    <button data-tw-merge="" class="transition duration-200 border shadow-sm inline-flex items-center justify-center py-2 px-3 rounded-md font-medium cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed bg-secondary/70 border-secondary/70 text-slate-500 dark:border-darkmode-400 dark:bg-darkmode-400 dark:text-slate-300 [&:hover:not(:disabled)]:bg-slate-100 [&:hover:not(:disabled)]:border-slate-100 [&:hover:not(:disabled)]:dark:border-darkmode-300/80 [&:hover:not(:disabled)]:dark:bg-darkmode-300/80 ml-auto w-32">Create Filter</button>
                                    <button data-tw-merge="" class="transition duration-200 border shadow-sm inline-flex items-center justify-center py-2 px-3 rounded-md font-medium cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed bg-primary border-primary text-white dark:border-primary ml-2 w-32">Search</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="flex w-full sm:w-auto">
                <a href="{{route('file-manager.add')}}"  data-tw-merge="" class="transition duration-200 border inline-flex items-center justify-center py-2 px-3 rounded-md font-medium cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed bg-primary border-primary text-white dark:border-primary mr-2 shadow-md">Unggah Berkas Baru</a>
                <div data-tw-merge="" data-tw-placement="bottom-end" class="dropdown relative"><button data-tw-merge="" data-tw-toggle="dropdown" aria-expanded="false" class="transition duration-200 border shadow-sm inline-flex items-center justify-center py-2 rounded-md font-medium cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed !box px-2"><span class="flex h-5 w-5 items-center justify-center">
                            <i data-tw-merge="" data-lucide="plus" class="stroke-1.5 h-4 w-4"></i>
                        </span></button>
                    <div data-transition="" data-selector=".show" data-enter="transition-all ease-linear duration-150" data-enter-from="absolute !mt-5 invisible opacity-0 translate-y-1" data-enter-to="!mt-1 visible opacity-100 translate-y-0" data-leave="transition-all ease-linear duration-150" data-leave-from="!mt-1 visible opacity-100 translate-y-0" data-leave-to="absolute !mt-5 invisible opacity-0 translate-y-1" class="dropdown-menu absolute z-[9999] hidden">
                        <div data-tw-merge="" class="dropdown-content rounded-md border-transparent bg-white p-2 shadow-[0px_3px_10px_#00000017] dark:border-transparent dark:bg-darkmode-600 w-40">
                            <a class="cursor-pointer flex items-center p-2 transition duration-300 ease-in-out rounded-md hover:bg-slate-200/60 dark:bg-darkmode-600 dark:hover:bg-darkmode-400 dropdown-item"><i data-tw-merge="" data-lucide="file" class="stroke-1.5 mr-2 h-4 w-4"></i>
                                Share Files</a>
                            <a class="cursor-pointer flex items-center p-2 transition duration-300 ease-in-out rounded-md hover:bg-slate-200/60 dark:bg-darkmode-600 dark:hover:bg-darkmode-400 dropdown-item"><i data-tw-merge="" data-lucide="settings" class="stroke-1.5 mr-2 h-4 w-4"></i>
                                Settings</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END: File Manager Filter -->
        <div class="mx-auto hidden text-slate-500 md:block">
            <center>
                 Menampilkan <span id="products_count_start"></span> - <span id="products_count_end"></span><br>dari <span id="products_count_total"></span> data<br>
                 <input name="_page" value="1" class="_filter" hidden>
             </center>
        </div>
        <!-- BEGIN: Directory & Files -->
        <div class="intro-y mt-5 grid grid-cols-12 gap-3 sm:gap-6" id="data-list">
            
        </div>
        <!-- END: Directory & Files -->
        <!-- BEGIN: Pagination -->
        <div class="intro-y mt-6 flex flex-wrap items-center sm:flex-row sm:flex-nowrap">
            <nav class="w-full sm:mr-auto sm:w-auto">
                <ul class="flex w-full mr-0 sm:mr-auto sm:w-auto" id="data-list-pagination"></ul>
            </nav>
            <select name="_limit" onchange="getData()" data-tw-merge="" class="_filter disabled:bg-slate-100 disabled:cursor-not-allowed disabled:dark:bg-darkmode-800/50 [&[readonly]]:bg-slate-100 [&[readonly]]:cursor-not-allowed [&[readonly]]:dark:bg-darkmode-800/50 transition duration-200 ease-in-out text-sm border-slate-200 shadow-sm rounded-md py-2 px-3 pr-8 focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus:border-primary focus:border-opacity-40 dark:bg-darkmode-800 dark:border-transparent dark:focus:ring-slate-700 dark:focus:ring-opacity-50 group-[.form-inline]:flex-1 !box mt-3 w-20 sm:mt-0">
                <option value="25">25</option>
                <option value="50">50</option>
                <option value="100">100</option>
                <option value="200">200</option>
            </select>
        </div>
        <!-- END: Pagination -->
    </div>
</div>
@endsection
@section('addition_css')
@endsection
@section('addition_script')
    <script src="{{ asset('page/js/file-manager-index.js').'?v='.date('YmdH').'1' }}"></script>
@endsection