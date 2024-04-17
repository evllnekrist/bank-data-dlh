@extends('layouts.app-enigma', ['breadcrumbs'=>[['label'=>'Kelola Input Dinamis','url'=>route('dynamic-input')],['label'=>'Tambah']]])
@section('title', 'Tambah | Input Dinamis')
@section('content')
    {{-- <h2 class="intro-y mt-10 text-lg font-medium">Input Dinamis</h2> --}}
    <div class="grid grid-cols-12">
        <div class="col-span-12">
            <div class="intro-y box lg:mt-5">
                <div class="flex items-end border-b border-slate-200/60 p-5 dark:border-darkmode-300">
                    <h2 class="mr-auto text-slate-400 font-medium">
                        Umum
                    </h2>
                </div>
                <form id="form-add" class="p-5">
                    <div class="flex flex-col xl:flex-row">
                        <div class="mt-6 flex-1 xl:mt-0">
                            <div class="grid grid-cols-12 gap-x-5 mb-3">
                                <div class="col-span-12 mb-5">
                                    <div>
                                        <label class="of-required text-slate-400">
                                            <small>Input ini akan digunakan untuk</small> Tipe Berkas : 
                                        </label>
                                        <div class="mt-2">
                                            <select required name="type_of_file" data-placeholder="Pilih salah satu..." class="tom-select w-full">
                                                <option value=""></option>
                                                @foreach($file_types as $item)                                                
                                                    <option value="{{$item->value}}" {{$selected_tof==$item->value?'selected':''}}>{{$item->label}} {{$item->description?' - '.$item->description:''}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                    <div class="mt-3">
                                        <label class="of-required text-slate-400">
                                            Tipe Input
                                        </label>
                                        <div class="mt-2">
                                            <select required name="type_of_input" data-placeholder="Pilih salah satu..." class="tom-select w-full" onchange="createBehaviorList()">
                                                <option value=""></option>
                                                @foreach($input_types as $item)                                                
                                                    <option value="{{$item->value}}">{{$item->label}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                    <div class="mt-3">
                                        <label class="of-required text-slate-400">
                                            Nama Label
                                        </label>
                                        <input required name="label" class="disabled:bg-slate-100 disabled:cursor-not-allowed dark:disabled:bg-darkmode-800/50 dark:disabled:border-transparent [&[readonly]]:bg-slate-100 [&[readonly]]:cursor-not-allowed [&[readonly]]:dark:bg-darkmode-800/50 [&[readonly]]:dark:border-transparent transition duration-200 ease-in-out w-full text-sm border-slate-200 shadow-sm rounded-md placeholder:text-slate-400/90 focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus:border-primary focus:border-opacity-40 dark:bg-darkmode-800 dark:border-transparent dark:focus:ring-slate-700 dark:focus:ring-opacity-50 dark:placeholder:text-slate-500/80 group-[.form-inline]:flex-1 group-[.input-group]:rounded-none group-[.input-group]:[&:not(:first-child)]:border-l-transparent group-[.input-group]:first:rounded-l group-[.input-group]:last:rounded-r group-[.input-group]:z-10">                                      
                                    </div>
                                    <div class="mt-3">
                                        <label class="of-required">
                                            <span class="text-danger font-bold">Nama Asli</span> <small>(berikutnya tidak dapat diganti)</small>
                                        </label>
                                        <input required name="name" class="lowercase nospace_rw_underscore disabled:bg-slate-100 disabled:cursor-not-allowed dark:disabled:bg-darkmode-800/50 dark:disabled:border-transparent [&[readonly]]:bg-slate-100 [&[readonly]]:cursor-not-allowed [&[readonly]]:dark:bg-darkmode-800/50 [&[readonly]]:dark:border-transparent transition duration-200 ease-in-out w-full text-sm border-slate-200 shadow-sm rounded-md placeholder:text-slate-400/90 focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus:border-primary focus:border-opacity-40 dark:bg-darkmode-800 dark:border-transparent dark:focus:ring-slate-700 dark:focus:ring-opacity-50 dark:placeholder:text-slate-500/80 group-[.form-inline]:flex-1 group-[.input-group]:rounded-none group-[.input-group]:[&:not(:first-child)]:border-l-transparent group-[.input-group]:first:rounded-l group-[.input-group]:last:rounded-r group-[.input-group]:z-10">                                        
                                    </div>
                                    <div class="mt-3">
                                        <label class="text-slate-400">
                                            Deskripsi
                                        </label>
                                        <textarea name="description" class="disabled:bg-slate-100 disabled:cursor-not-allowed dark:disabled:bg-darkmode-800/50 dark:disabled:border-transparent [&[readonly]]:bg-slate-100 [&[readonly]]:cursor-not-allowed [&[readonly]]:dark:bg-darkmode-800/50 [&[readonly]]:dark:border-transparent transition duration-200 ease-in-out w-full text-sm border-slate-200 shadow-sm rounded-md placeholder:text-slate-400/90 focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus:border-primary focus:border-opacity-40 dark:bg-darkmode-800 dark:border-transparent dark:focus:ring-slate-700 dark:focus:ring-opacity-50 dark:placeholder:text-slate-500/80 group-[.form-inline]:flex-1 group-[.input-group]:rounded-none group-[.input-group]:[&:not(:first-child)]:border-l-transparent group-[.input-group]:first:rounded-l group-[.input-group]:last:rounded-r group-[.input-group]:z-10"></textarea>                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="mx-auto w-3/5 xl:ml-6 xl:mr-0 bg-mute">
                            <div>
                                <label class="text-slate-400">
                                    Terapkan
                                </label>
                                <div class="my-4">
                                    <div data-tw-merge class="flex items-center">
                                        <input data-tw-merge name="is_enabled" checked type="checkbox" class="transition-all duration-100 ease-in-out shadow-sm border-slate-200 cursor-pointer rounded focus:ring-4 focus:ring-offset-0 focus:ring-primary focus:ring-opacity-20 dark:bg-darkmode-800 dark:border-transparent dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&[type='radio']]:checked:bg-primary [&[type='radio']]:checked:border-primary [&[type='radio']]:checked:border-opacity-10 [&[type='checkbox']]:checked:bg-primary [&[type='checkbox']]:checked:border-primary [&[type='checkbox']]:checked:border-opacity-10 [&:disabled:not(:checked)]:bg-slate-100 [&:disabled:not(:checked)]:cursor-not-allowed [&:disabled:not(:checked)]:dark:bg-darkmode-800/50 [&:disabled:checked]:opacity-70 [&:disabled:checked]:cursor-not-allowed [&:disabled:checked]:dark:bg-darkmode-800/50 w-[38px] h-[24px] p-px rounded-full relative before:w-[20px] before:h-[20px] before:shadow-[1px_1px_3px_rgba(0,0,0,0.25)] before:transition-[margin-left] before:duration-200 before:ease-in-out before:absolute before:inset-y-0 before:my-auto before:rounded-full before:dark:bg-darkmode-600 checked:bg-primary checked:border-primary checked:bg-none before:checked:ml-[14px] before:checked:bg-white w-[38px] h-[24px] p-px rounded-full relative before:w-[20px] before:h-[20px] before:shadow-[1px_1px_3px_rgba(0,0,0,0.25)] before:transition-[margin-left] before:duration-200 before:ease-in-out before:absolute before:inset-y-0 before:my-auto before:rounded-full before:dark:bg-darkmode-600 checked:bg-primary checked:border-primary checked:bg-none before:checked:ml-[14px] before:checked:bg-white"/>
                                        <label data-tw-merge class="cursor-pointer ml-2">aktif</label>
                                    </div>
                                </div>
                            </div>
                            <div class="mt-3">
                                <label class="text-slate-400">
                                    Apakah <b><u>wajib</u></b> diisi?
                                </label>
                                <div class="my-2">
                                    <div data-tw-merge class="flex items-center">
                                        <input data-tw-merge name="is_required" type="checkbox" class="transition-all duration-100 ease-in-out shadow-sm border-slate-200 cursor-pointer rounded focus:ring-4 focus:ring-offset-0 focus:ring-primary focus:ring-opacity-20 dark:bg-darkmode-800 dark:border-transparent dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&[type='radio']]:checked:bg-primary [&[type='radio']]:checked:border-primary [&[type='radio']]:checked:border-opacity-10 [&[type='checkbox']]:checked:bg-primary [&[type='checkbox']]:checked:border-primary [&[type='checkbox']]:checked:border-opacity-10 [&:disabled:not(:checked)]:bg-slate-100 [&:disabled:not(:checked)]:cursor-not-allowed [&:disabled:not(:checked)]:dark:bg-darkmode-800/50 [&:disabled:checked]:opacity-70 [&:disabled:checked]:cursor-not-allowed [&:disabled:checked]:dark:bg-darkmode-800/50 w-[38px] h-[24px] p-px rounded-full relative before:w-[20px] before:h-[20px] before:shadow-[1px_1px_3px_rgba(0,0,0,0.25)] before:transition-[margin-left] before:duration-200 before:ease-in-out before:absolute before:inset-y-0 before:my-auto before:rounded-full before:dark:bg-darkmode-600 checked:bg-primary checked:border-primary checked:bg-none before:checked:ml-[14px] before:checked:bg-white w-[38px] h-[24px] p-px rounded-full relative before:w-[20px] before:h-[20px] before:shadow-[1px_1px_3px_rgba(0,0,0,0.25)] before:transition-[margin-left] before:duration-200 before:ease-in-out before:absolute before:inset-y-0 before:my-auto before:rounded-full before:dark:bg-darkmode-600 checked:bg-primary checked:border-primary checked:bg-none before:checked:ml-[14px] before:checked:bg-white"/>
                                        <label data-tw-merge class="cursor-pointer ml-2">Ya</label>
                                    </div>
                                </div>
                            </div>
                            <div class="mt-3">
                                <label class="text-slate-400">
                                    Apakah dapat menerima <b><u>jawaban lebih dari satu</u></b>?<br><small>(hanya berlaku untuk input seperti file dll yang memiliki mode jawaban ganda)</small>
                                </label>
                                <div class="my-2">
                                    <div data-tw-merge class="flex items-center">
                                        <input data-tw-merge name="is_multiple" type="checkbox" class="transition-all duration-100 ease-in-out shadow-sm border-slate-200 cursor-pointer rounded focus:ring-4 focus:ring-offset-0 focus:ring-primary focus:ring-opacity-20 dark:bg-darkmode-800 dark:border-transparent dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&[type='radio']]:checked:bg-primary [&[type='radio']]:checked:border-primary [&[type='radio']]:checked:border-opacity-10 [&[type='checkbox']]:checked:bg-primary [&[type='checkbox']]:checked:border-primary [&[type='checkbox']]:checked:border-opacity-10 [&:disabled:not(:checked)]:bg-slate-100 [&:disabled:not(:checked)]:cursor-not-allowed [&:disabled:not(:checked)]:dark:bg-darkmode-800/50 [&:disabled:checked]:opacity-70 [&:disabled:checked]:cursor-not-allowed [&:disabled:checked]:dark:bg-darkmode-800/50 w-[38px] h-[24px] p-px rounded-full relative before:w-[20px] before:h-[20px] before:shadow-[1px_1px_3px_rgba(0,0,0,0.25)] before:transition-[margin-left] before:duration-200 before:ease-in-out before:absolute before:inset-y-0 before:my-auto before:rounded-full before:dark:bg-darkmode-600 checked:bg-primary checked:border-primary checked:bg-none before:checked:ml-[14px] before:checked:bg-white w-[38px] h-[24px] p-px rounded-full relative before:w-[20px] before:h-[20px] before:shadow-[1px_1px_3px_rgba(0,0,0,0.25)] before:transition-[margin-left] before:duration-200 before:ease-in-out before:absolute before:inset-y-0 before:my-auto before:rounded-full before:dark:bg-darkmode-600 checked:bg-primary checked:border-primary checked:bg-none before:checked:ml-[14px] before:checked:bg-white"/>
                                        <label data-tw-merge class="cursor-pointer ml-2">Ya</label>
                                    </div>
                                </div>
                            </div>
                            <div class="mt-2">
                                <label class="text-slate-400">
                                    Perilaku Khusus <small id="select-behavior-data-info"></small>
                                </label>
                                <div class="mt-2" id="select-behavior">
                                    <select name="behavior[]" data-placeholder="Pilih TIPE INPUT terlebih dahulu" class="tom-select w-full" multiple>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="col-span-12 mb-10">
            <button type="button" id="btn-submit-add"
            class="btn-submit my-5 w-full flex justify-center p-4 rounded-full tracking-wide font-semibold ring-4 ring-primary ring-opacity-20 
            focus-visible:outline-none shadow-lg cursor-pointer transition ease-in duration-300 transition duration-200 border shadow-sm inline-flex items-center justify-center rounded-md cursor-pointer
            bg-primary text-white disabled:bg-secondary/70 disabled:border-secondary/70 disabled:text-slate-500">
                Simpan
            </button>
        </div>
    </div>
@endsection
@section('addition_css')
    <link rel="stylesheet" href="{{ asset('dist/css/vendors/tom-select.css') }}">
@endsection
@section('addition_script')
    <script>
        let behavior_list = JSON.parse(`{!! json_encode($input_behavior) !!}`);
    </script>
    <script src="{{ asset('dist/js/vendors/tom-select.js') }}"></script>
    <script src="{{ asset('dist/js/components/base/tom-select.js') }}"></script>
    <script src="{{ asset('page/js/dynamic-input-cu.js').'?v='.date('YmdH').'1' }}"></script>
@endsection