@extends('layouts.app-enigma', ['breadcrumbs'=>[['label'=>'Berkas','url'=>route('file-manager')],['label'=>'Edit']]])
@section('title', 'Edit | Berkas')
@section('content')
    {{-- <h2 class="intro-y mt-10 text-lg font-medium">Berkas</h2> --}}
    <div class="grid grid-cols-12">
        {{-- STATIC ---------------------------- start --}}
        <div class="col-span-12">
            <div class="intro-y box lg:mt-5">
                <div class="flex items-end border-b border-slate-200/60 p-5 dark:border-darkmode-300">
                    <h2 class="mr-auto text-slate-400 font-medium">
                        Umum
                    </h2>
                </div>
                <form id="form-edit" class="p-5">
                    <div class="flex flex-col xl:flex-row">
                        <div class="mt-6 flex-1 xl:mt-0">
                            <div class="grid grid-cols-12 gap-x-5 mb-3">
                                <div class="col-span-12 mb-5">
                                    <input name="id" value="{{@$selected->id}}" hidden>
                                    <input id="is_uneditable" value="{{$is_uneditable}}" hidden>
                                    <div>
                                        <label class="of-required text-slate-400">
                                            Judul/Perihal
                                        </label>
                                        <textarea required name="title" class="disabled:bg-slate-100 disabled:cursor-not-allowed dark:disabled:bg-darkmode-800/50 dark:disabled:border-transparent 
                                        [&[readonly]]:bg-slate-100 [&[readonly]]:cursor-not-allowed [&[readonly]]:dark:bg-darkmode-800/50 [&[readonly]]:dark:border-transparent 
                                        transition duration-200 ease-in-out w-full text-sm border-slate-200 shadow-sm rounded-md placeholder:text-slate-400/90 
                                        focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus:border-primary focus:border-opacity-40 dark:bg-darkmode-800 dark:border-transparent dark:focus:ring-slate-700 dark:focus:ring-opacity-50 
                                        dark:placeholder:text-slate-500/80 group-[.form-inline]:flex-1 group-[.input-group]:rounded-none group-[.input-group]:[&:not(:first-child)]:border-l-transparent 
                                        group-[.input-group]:first:rounded-l group-[.input-group]:last:rounded-r group-[.input-group]:z-10" rows="3" {{$is_uneditable?'readonly':''}}>{{@$selected->title}}</textarea>                                        
                                    </div>
                                    <div class="mt-1">
                                        <label class="of-required text-slate-400">
                                            Pemilik Berkas (Satuan Kerja)
                                        </label>
                                        <div class="mt-2">
                                            <select required name="user_group_id" data-placeholder="Pilih salah satu..." class="tom-select w-full" {{$is_uneditable?'disabled':''}}>
                                                <option value=""></option>
                                                @foreach($user_groups as $item)                                                
                                                    <option value="{{$item->id}}" {{@$selected->user_group_id == $item->id?'selected':''}}>{{$item->nickname}} - {{$item->fullname}}</option>
                                                @endforeach
                                            </select>
                                        </div>                                
                                    </div>
                                </div>
                                <div class="col-span-12 md:col-span-6">
                                    <div class="mt-3">
                                        <label class="of-required text-slate-400">
                                            Tipe Publisitas
                                        </label>
                                        <div class="mt-2">
                                            <select required name="type_of_publicity" data-placeholder="Pilih salah satu..." class="tom-select w-full" {{$is_uneditable?'disabled':''}}>
                                                @foreach($publicity_types as $item)                                                
                                                    <option value="{{$item->value}}" {{@$selected->type_of_publicity == $item->value?'selected':''}}>{{$item->label}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                    <div class="mt-3">
                                        <label class="of-required text-slate-400">
                                            Tipe Berkas
                                        </label>
                                        <div class="mt-2">
                                            <select required name="type_of_file" data-placeholder="Pilih salah satu..." class="tom-select w-full" onchange="getDynamicInputs()" {{$is_uneditable?'disabled':''}}>
                                                <option value=""></option>
                                                @foreach($file_types as $item)                                                
                                                    <option value="{{$item->value}}" {{@$selected->type_of_file == $item->value?'selected':''}}>{{$item->label}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-span-12 md:col-span-6">
                                    <div class="mt-3">
                                        <label class="of-required text-slate-400">
                                            Bisa Diedit Oleh
                                        </label>
                                        <div class="mt-2">
                                            <select required name="editorial_permission" data-placeholder="Pilih salah satu..." class="tom-select w-full" {{$is_uneditable?'disabled':''}}>
                                                @foreach($editorial_permissions as $item)                                                
                                                    <option value="{{$item->value}}" {{@$selected->editorial_permission == $item->value?'selected':''}}>{{$item->label}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                    <div class="mt-3">
                                        <label class="of-required text-slate-400">
                                            Tahun
                                        </label>
                                        <div class="mt-2">
                                            <input required name="year" value="{{@$selected->year}}" type="number" min="2000" max="2050" placeholder="20**" class="disabled:bg-slate-100 disabled:cursor-not-allowed dark:disabled:bg-darkmode-800/50 dark:disabled:border-transparent [&[readonly]]:bg-slate-100 [&[readonly]]:cursor-not-allowed [&[readonly]]:dark:bg-darkmode-800/50 [&[readonly]]:dark:border-transparent transition duration-200 ease-in-out w-full text-sm border-slate-200 shadow-sm rounded-md placeholder:text-slate-400/90 focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus:border-primary focus:border-opacity-40 dark:bg-darkmode-800 dark:border-transparent dark:focus:ring-slate-700 dark:focus:ring-opacity-50 dark:placeholder:text-slate-500/80 group-[.form-inline]:flex-1 group-[.input-group]:rounded-none group-[.input-group]:[&:not(:first-child)]:border-l-transparent group-[.input-group]:first:rounded-l group-[.input-group]:last:rounded-r group-[.input-group]:z-10">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-span-12">
                                    <div class="mt-3">
                                        <label class="text-slate-400">
                                            Kata Kunci
                                        </label>
                                        <div class="mt-2">
                                            @php
                                                $selected->keywords = explode(",",$selected->keywords);    
                                            @endphp
                                            <select name="keywords[]" data-placeholder="Pilih salah satu atau lebih..." class="tom-select w-full" multiple="multiple" {{$is_uneditable?'disabled':''}}>
                                                <option value=""></option>
                                                @foreach($keywords as $item)                                                
                                                    <option value="{{$item->subject}}" {{in_array($item->subject,$selected->keywords)?'selected':''}}>{{$item->subject}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="mx-auto w-1/2 xl:ml-6 xl:mr-0">
                            <div>
                                {{-- https://tailwindcomponents.com/component/tailwind-css-file-upload --}}
                                <label class="text-sm text-slate-400 tracking-wide">Berkas</label>
                                <div class="grid grid-cols-1 space-y-2 border-dashed border-2 border-indigo-600">
                                    <div class="flex items-center justify-center w-full">
                                        <label class="flex flex-col rounded-lg border-4 border-dashed w-full h-60 py-5 px-2 group text-center">
                                            <div class="h-full w-full text-center flex flex-col items-center justify-center items-center  ">
                                                <svg xmlns="http://www.w3.org/2000/svg" id="input-file-none-0"
                                                    class="w-10 h-10 text-blue-400 group-hover:text-blue-600 {{@$selected->file_main?'hidden':''}}" 
                                                    fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 16a4 4 0 01-.88-7.903A5 5 0 1115.9 6L16 6a5 5 0 011 9.9M15 13l-3-3m0 0l-3 3m3-3v12" />
                                                </svg>
                                                @if(@$selected->file_main)
                                                    <a class="text-xs" href="{{asset(@$selected->file_main)}}" target="_blank">klik <u class="text-primary font-medium">ini untuk buka file</u> lebih besar</a>
                                                @endif
                                                <div class="flex flex-auto max-h-48 mb-5 mx-auto {{!@$selected->file_main?'hidden':''}}" id="input-file-preview-0"></div>
                                                @if(!$is_uneditable)
                                                    <p class="pointer-none text-gray-500 text-xs"><i>Drag & Drop</i> disini atau <a class="text-theme-1 underline">pilih dari komputer</a></p>
                                                @endif
                                                <input name="file_main" data-value="{{asset(@$selected->file_main)}}" data-index-input-file="0" type="file" 
                                                    accept="{{implode(',',array_merge(Config::get('app.accept_mimes')['img'],Config::get('app.accept_mimes')['doc']))}}"
                                                    class="input-file mt-2 block w-full text-xs border border-gray-300 rounded-lg cursor-pointer {{$is_uneditable?'hidden':''}}">
                                            </div>
                                        </label>
                                    </div>
                                </div>
                                @if(!$is_uneditable)
                                <p class="text-sm text-slate-300">
                                    <i>* tipe dokumen, gambar,<br>max 5MB</i>
                                </p>
                                @endif
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        {{-- STATIC ---------------------------- end ----}}
        {{-- DYNAMIC --------------------------- start --}}
        <div class="col-span-12">
            <div class="intro-y box lg:mt-5" id="dynamic-input-inner-wrap-wrap" style="display:none; z-index: 0 !important">
                <div class="flex items-end border-b border-slate-200/60 p-5 dark:border-darkmode-400">
                    <h2 class="mr-auto text-slate-400 font-medium">
                        Khusus
                    </h2>
                    <input id="dynamic-input-value" value="{{@$selected->dynamic_inputs}}" hidden>
                </div>
                <form id="dynamic-input-inner-wrap" class="p-5">
                    <div class="flex flex-col xl:flex-row">
                        <div class="mt-6 flex-1 xl:mt-0" id="dynamic-input-inner-wrap-noimg">
                        </div>
                        <div class="mx-auto w-2/5 xl:ml-6 xl:mr-0" id="dynamic-input-inner-wrap-img">
                        </div>
                    </div>
                </form>
            </div>
            <div class="intro-y" id="dynamic-input-inner-wrap-loading" style="display:none;">
                <img src="{{asset('img/loading-form.gif')}}" class="mx-auto w-1/4">
            </div>
            <div class="intro-y mt-5" id="dynamic-input-inner-wrap-info">
            </div>
        </div>
        {{-- DYNAMIC --------------------------- end ----}}
        @if($is_uneditable)
            <div class="col-span-12 mb-10">
                <i class="mx-auto text-slate-300">* hanya baca, tidak dapat diedit</i>
            </div>
        @else
        <div class="col-span-12 mb-10">
            <button type="button" id="btn-submit-edit"
            class="btn-submit my-5 w-full flex justify-center p-4 rounded-full tracking-wide font-semibold ring-4 ring-primary ring-opacity-20 
            focus-visible:outline-none shadow-lg cursor-pointer transition ease-in duration-300 transition duration-200 border shadow-sm inline-flex items-center justify-center rounded-md cursor-pointer
            bg-primary text-white disabled:bg-secondary/70 disabled:border-secondary/70 disabled:text-slate-500">
                Simpan Perubahan
            </button>
        </div>
        @endif
    </div>
@endsection
@section('addition_css')
    <link rel="stylesheet" href="{{ asset('dist/css/vendors/tom-select.css') }}">
@endsection
@section('addition_script')
    <script src="{{ asset('dist/js/vendors/tom-select.js') }}"></script>
    <script src="{{ asset('dist/js/components/base/tom-select.js') }}"></script>
    <script src="{{ asset('page/js/file-manager-cu.js').'?v='.date('YmdH').'2' }}"></script>
@endsection