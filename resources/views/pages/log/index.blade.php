@extends('layouts.app-enigma')
@section('title', 'Log')
@section('content')
<div class="mt-8 grid grid-cols-12 gap-6">
    <div class="col-span-12 lg:col-span-3 2xl:col-span-2">
        <!-- BEGIN: Inbox Menu -->
        <div class="intro-y box bg-primary p-5">
            <div class="mt-6 text-white">
                <a class="flex items-center rounded-md bg-white/10 px-3 py-2 font-medium dark:bg-darkmode-700" href="">
                    <i data-tw-merge="" data-lucide="mail" class="stroke-1.5 mr-2 h-4 w-4"></i>
                    Inbox
                </a>
                <a class="mt-2 flex items-center rounded-md px-3 py-2" href="">
                    <i data-tw-merge="" data-lucide="star" class="stroke-1.5 mr-2 h-4 w-4"></i>
                    Marked
                </a>
                <a class="mt-2 flex items-center rounded-md px-3 py-2" href="">
                    <i data-tw-merge="" data-lucide="inbox" class="stroke-1.5 mr-2 h-4 w-4"></i>
                    Draft
                </a>
                <a class="mt-2 flex items-center rounded-md px-3 py-2" href="">
                    <i data-tw-merge="" data-lucide="send" class="stroke-1.5 mr-2 h-4 w-4"></i>
                    Sent
                </a>
                <a class="mt-2 flex items-center rounded-md px-3 py-2" href="">
                    <i data-tw-merge="" data-lucide="trash" class="stroke-1.5 mr-2 h-4 w-4"></i>
                    Trash
                </a>
            </div>
            <div class="mt-4 border-t border-white/10 pt-4 text-white dark:border-darkmode-400">
                <a class="flex items-center truncate px-3 py-2" href="">
                    <div class="mr-3 h-2 w-2 rounded-full bg-pending"></div>
                    Custom Work
                </a>
                <a class="mt-2 flex items-center truncate rounded-md px-3 py-2" href="">
                    <div class="mr-3 h-2 w-2 rounded-full bg-success"></div>
                    Important Meetings
                </a>
                <a class="mt-2 flex items-center truncate rounded-md px-3 py-2" href="">
                    <div class="mr-3 h-2 w-2 rounded-full bg-warning"></div>
                    Work
                </a>
                <a class="mt-2 flex items-center truncate rounded-md px-3 py-2" href="">
                    <div class="mr-3 h-2 w-2 rounded-full bg-pending"></div>
                    Design
                </a>
                <a class="mt-2 flex items-center truncate rounded-md px-3 py-2" href="">
                    <div class="mr-3 h-2 w-2 rounded-full bg-danger"></div>
                    Next Week
                </a>
                <a class="mt-2 flex items-center truncate rounded-md px-3 py-2" href="">
                    <i data-tw-merge="" data-lucide="plus" class="stroke-1.5 mr-2 h-4 w-4"></i>
                    Add New Label
                </a>
            </div>
        </div>
        <!-- END: Inbox Menu -->
    </div>
    <div class="col-span-12 lg:col-span-9 2xl:col-span-10">
        <!-- BEGIN: Inbox Filter -->
        <div class="intro-y flex flex-col-reverse items-center sm:flex-row">
            <div class="relative mr-auto mt-3 w-full sm:mt-0 sm:w-auto">
                <i data-tw-merge="" data-lucide="search" class="stroke-1.5 absolute inset-y-0 left-0 z-10 my-auto ml-3 h-4 w-4 text-slate-500"></i>
                <input data-tw-merge="" type="text" placeholder="Search mail" class="disabled:bg-slate-100 disabled:cursor-not-allowed dark:disabled:bg-darkmode-800/50 dark:disabled:border-transparent [&[readonly]]:bg-slate-100 [&[readonly]]:cursor-not-allowed [&[readonly]]:dark:bg-darkmode-800/50 [&[readonly]]:dark:border-transparent transition duration-200 ease-in-out w-full text-sm border-slate-200 shadow-sm rounded-md placeholder:text-slate-400/90 focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus:border-primary focus:border-opacity-40 dark:bg-darkmode-800 dark:border-transparent dark:focus:ring-slate-700 dark:focus:ring-opacity-50 dark:placeholder:text-slate-500/80 group-[.form-inline]:flex-1 group-[.input-group]:rounded-none group-[.input-group]:[&:not(:first-child)]:border-l-transparent group-[.input-group]:first:rounded-l group-[.input-group]:last:rounded-r group-[.input-group]:z-10 !box px-10 sm:w-64">
                <div data-tw-merge="" data-tw-placement="bottom-start" class="dropdown absolute inset-y-0 right-0 mr-3 flex items-center"><a data-tw-toggle="dropdown" aria-expanded="false" href="javascript:;" class="cursor-pointer block h-4 w-4" role="button"><i data-tw-merge="" data-lucide="chevron-down" class="stroke-1.5 h-4 w-4 cursor-pointer text-slate-500"></i>
                    </a>
                    <div data-transition="" data-selector=".show" data-enter="transition-all ease-linear duration-150" data-enter-from="absolute !mt-5 invisible opacity-0 translate-y-1" data-enter-to="!mt-1 visible opacity-100 translate-y-0" data-leave="transition-all ease-linear duration-150" data-leave-from="!mt-1 visible opacity-100 translate-y-0" data-leave-to="absolute !mt-5 invisible opacity-0 translate-y-1" class="dropdown-menu absolute z-[9999] hidden">
                        <div data-tw-merge="" class="dropdown-content rounded-md border-transparent bg-white p-2 shadow-[0px_3px_10px_#00000017] dark:border-transparent dark:bg-darkmode-600 !-ml-[228px] mt-2.5 w-[478px] pt-2">
                            <div class="grid grid-cols-12 gap-4 gap-y-3 p-3">
                                <div class="col-span-6">
                                    <label data-tw-merge="" for="input-filter-1" class="inline-block mb-2 group-[.form-inline]:mb-2 group-[.form-inline]:sm:mb-0 group-[.form-inline]:sm:mr-5 group-[.form-inline]:sm:text-right text-xs">
                                        From
                                    </label>
                                    <input data-tw-merge="" id="input-filter-1" type="text" placeholder="example@gmail.com" class="disabled:bg-slate-100 disabled:cursor-not-allowed dark:disabled:bg-darkmode-800/50 dark:disabled:border-transparent [&[readonly]]:bg-slate-100 [&[readonly]]:cursor-not-allowed [&[readonly]]:dark:bg-darkmode-800/50 [&[readonly]]:dark:border-transparent transition duration-200 ease-in-out w-full text-sm border-slate-200 shadow-sm rounded-md placeholder:text-slate-400/90 focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus:border-primary focus:border-opacity-40 dark:bg-darkmode-800 dark:border-transparent dark:focus:ring-slate-700 dark:focus:ring-opacity-50 dark:placeholder:text-slate-500/80 group-[.form-inline]:flex-1 group-[.input-group]:rounded-none group-[.input-group]:[&:not(:first-child)]:border-l-transparent group-[.input-group]:first:rounded-l group-[.input-group]:last:rounded-r group-[.input-group]:z-10 flex-1">
                                </div>
                                <div class="col-span-6">
                                    <label data-tw-merge="" for="input-filter-2" class="inline-block mb-2 group-[.form-inline]:mb-2 group-[.form-inline]:sm:mb-0 group-[.form-inline]:sm:mr-5 group-[.form-inline]:sm:text-right text-xs">
                                        To
                                    </label>
                                    <input data-tw-merge="" id="input-filter-2" type="text" placeholder="example@gmail.com" class="disabled:bg-slate-100 disabled:cursor-not-allowed dark:disabled:bg-darkmode-800/50 dark:disabled:border-transparent [&[readonly]]:bg-slate-100 [&[readonly]]:cursor-not-allowed [&[readonly]]:dark:bg-darkmode-800/50 [&[readonly]]:dark:border-transparent transition duration-200 ease-in-out w-full text-sm border-slate-200 shadow-sm rounded-md placeholder:text-slate-400/90 focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus:border-primary focus:border-opacity-40 dark:bg-darkmode-800 dark:border-transparent dark:focus:ring-slate-700 dark:focus:ring-opacity-50 dark:placeholder:text-slate-500/80 group-[.form-inline]:flex-1 group-[.input-group]:rounded-none group-[.input-group]:[&:not(:first-child)]:border-l-transparent group-[.input-group]:first:rounded-l group-[.input-group]:last:rounded-r group-[.input-group]:z-10 flex-1">
                                </div>
                                <div class="col-span-6">
                                    <label data-tw-merge="" for="input-filter-3" class="inline-block mb-2 group-[.form-inline]:mb-2 group-[.form-inline]:sm:mb-0 group-[.form-inline]:sm:mr-5 group-[.form-inline]:sm:text-right text-xs">
                                        Subject
                                    </label>
                                    <input data-tw-merge="" id="input-filter-3" type="text" placeholder="Important Meeting" class="disabled:bg-slate-100 disabled:cursor-not-allowed dark:disabled:bg-darkmode-800/50 dark:disabled:border-transparent [&[readonly]]:bg-slate-100 [&[readonly]]:cursor-not-allowed [&[readonly]]:dark:bg-darkmode-800/50 [&[readonly]]:dark:border-transparent transition duration-200 ease-in-out w-full text-sm border-slate-200 shadow-sm rounded-md placeholder:text-slate-400/90 focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus:border-primary focus:border-opacity-40 dark:bg-darkmode-800 dark:border-transparent dark:focus:ring-slate-700 dark:focus:ring-opacity-50 dark:placeholder:text-slate-500/80 group-[.form-inline]:flex-1 group-[.input-group]:rounded-none group-[.input-group]:[&:not(:first-child)]:border-l-transparent group-[.input-group]:first:rounded-l group-[.input-group]:last:rounded-r group-[.input-group]:z-10 flex-1">
                                </div>
                                <div class="col-span-6">
                                    <label data-tw-merge="" for="input-filter-4" class="inline-block mb-2 group-[.form-inline]:mb-2 group-[.form-inline]:sm:mb-0 group-[.form-inline]:sm:mr-5 group-[.form-inline]:sm:text-right text-xs">
                                        Has the Words
                                    </label>
                                    <input data-tw-merge="" id="input-filter-4" type="text" placeholder="Job, Work, Documentation" class="disabled:bg-slate-100 disabled:cursor-not-allowed dark:disabled:bg-darkmode-800/50 dark:disabled:border-transparent [&[readonly]]:bg-slate-100 [&[readonly]]:cursor-not-allowed [&[readonly]]:dark:bg-darkmode-800/50 [&[readonly]]:dark:border-transparent transition duration-200 ease-in-out w-full text-sm border-slate-200 shadow-sm rounded-md placeholder:text-slate-400/90 focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus:border-primary focus:border-opacity-40 dark:bg-darkmode-800 dark:border-transparent dark:focus:ring-slate-700 dark:focus:ring-opacity-50 dark:placeholder:text-slate-500/80 group-[.form-inline]:flex-1 group-[.input-group]:rounded-none group-[.input-group]:[&:not(:first-child)]:border-l-transparent group-[.input-group]:first:rounded-l group-[.input-group]:last:rounded-r group-[.input-group]:z-10 flex-1">
                                </div>
                                <div class="col-span-6">
                                    <label data-tw-merge="" for="input-filter-5" class="inline-block mb-2 group-[.form-inline]:mb-2 group-[.form-inline]:sm:mb-0 group-[.form-inline]:sm:mr-5 group-[.form-inline]:sm:text-right text-xs">
                                        Doesn't Have
                                    </label>
                                    <input data-tw-merge="" id="input-filter-5" type="text" placeholder="Job, Work, Documentation" class="disabled:bg-slate-100 disabled:cursor-not-allowed dark:disabled:bg-darkmode-800/50 dark:disabled:border-transparent [&[readonly]]:bg-slate-100 [&[readonly]]:cursor-not-allowed [&[readonly]]:dark:bg-darkmode-800/50 [&[readonly]]:dark:border-transparent transition duration-200 ease-in-out w-full text-sm border-slate-200 shadow-sm rounded-md placeholder:text-slate-400/90 focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus:border-primary focus:border-opacity-40 dark:bg-darkmode-800 dark:border-transparent dark:focus:ring-slate-700 dark:focus:ring-opacity-50 dark:placeholder:text-slate-500/80 group-[.form-inline]:flex-1 group-[.input-group]:rounded-none group-[.input-group]:[&:not(:first-child)]:border-l-transparent group-[.input-group]:first:rounded-l group-[.input-group]:last:rounded-r group-[.input-group]:z-10 flex-1">
                                </div>
                                <div class="col-span-6">
                                    <label data-tw-merge="" for="input-filter-6" class="inline-block mb-2 group-[.form-inline]:mb-2 group-[.form-inline]:sm:mb-0 group-[.form-inline]:sm:mr-5 group-[.form-inline]:sm:text-right text-xs">
                                        Size
                                    </label>
                                    <select data-tw-merge="" id="input-filter-6" class="disabled:bg-slate-100 disabled:cursor-not-allowed disabled:dark:bg-darkmode-800/50 [&[readonly]]:bg-slate-100 [&[readonly]]:cursor-not-allowed [&[readonly]]:dark:bg-darkmode-800/50 transition duration-200 ease-in-out w-full text-sm border-slate-200 shadow-sm rounded-md py-2 px-3 pr-8 focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus:border-primary focus:border-opacity-40 dark:bg-darkmode-800 dark:border-transparent dark:focus:ring-slate-700 dark:focus:ring-opacity-50 group-[.form-inline]:flex-1 flex-1">
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
                
            </div>
        </div>
        <!-- END: Inbox Filter -->
        <!-- BEGIN: Inbox Content -->
        <div class="intro-y box mt-5">
            <div class="flex flex-col-reverse border-b border-slate-200/60 p-5 text-slate-500 sm:flex-row">
                <div class="-mx-5 mt-3 flex items-center border-t border-slate-200/60 px-5 pt-5 sm:mx-0 sm:mt-0 sm:border-0 sm:px-0 sm:pt-0">
                    <input data-tw-merge="" type="checkbox" class="transition-all duration-100 ease-in-out shadow-sm cursor-pointer rounded focus:ring-4 focus:ring-offset-0 focus:ring-primary focus:ring-opacity-20 dark:bg-darkmode-800 dark:border-transparent dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&[type='radio']]:checked:bg-primary [&[type='radio']]:checked:border-primary [&[type='radio']]:checked:border-opacity-10 [&[type='checkbox']]:checked:bg-primary [&[type='checkbox']]:checked:border-primary [&[type='checkbox']]:checked:border-opacity-10 [&:disabled:not(:checked)]:bg-slate-100 [&:disabled:not(:checked)]:cursor-not-allowed [&:disabled:not(:checked)]:dark:bg-darkmode-800/50 [&:disabled:checked]:opacity-70 [&:disabled:checked]:cursor-not-allowed [&:disabled:checked]:dark:bg-darkmode-800/50 border-slate-400 checked:border-primary">
                    <div data-tw-merge="" data-tw-placement="bottom-start" class="dropdown relative ml-1"><button data-tw-toggle="dropdown" aria-expanded="false" class="cursor-pointer block h-5 w-5"><i data-tw-merge="" data-lucide="chevron-down" class="stroke-1.5 w-5 h-5"></i>
                        </button>
                        <div data-transition="" data-selector=".show" data-enter="transition-all ease-linear duration-150" data-enter-from="absolute !mt-5 invisible opacity-0 translate-y-1" data-enter-to="!mt-1 visible opacity-100 translate-y-0" data-leave="transition-all ease-linear duration-150" data-leave-from="!mt-1 visible opacity-100 translate-y-0" data-leave-to="absolute !mt-5 invisible opacity-0 translate-y-1" class="dropdown-menu absolute z-[9999] hidden">
                            <div data-tw-merge="" class="dropdown-content rounded-md border-transparent bg-white p-2 shadow-[0px_3px_10px_#00000017] dark:border-transparent dark:bg-darkmode-600 w-32 text-slate-800 dark:text-slate-300">
                                <a class="cursor-pointer flex items-center p-2 transition duration-300 ease-in-out rounded-md hover:bg-slate-200/60 dark:bg-darkmode-600 dark:hover:bg-darkmode-400 dropdown-item">All</a>
                                <a class="cursor-pointer flex items-center p-2 transition duration-300 ease-in-out rounded-md hover:bg-slate-200/60 dark:bg-darkmode-600 dark:hover:bg-darkmode-400 dropdown-item">None</a>
                                <a class="cursor-pointer flex items-center p-2 transition duration-300 ease-in-out rounded-md hover:bg-slate-200/60 dark:bg-darkmode-600 dark:hover:bg-darkmode-400 dropdown-item">Read</a>
                                <a class="cursor-pointer flex items-center p-2 transition duration-300 ease-in-out rounded-md hover:bg-slate-200/60 dark:bg-darkmode-600 dark:hover:bg-darkmode-400 dropdown-item">Unread</a>
                                <a class="cursor-pointer flex items-center p-2 transition duration-300 ease-in-out rounded-md hover:bg-slate-200/60 dark:bg-darkmode-600 dark:hover:bg-darkmode-400 dropdown-item">Starred</a>
                                <a class="cursor-pointer flex items-center p-2 transition duration-300 ease-in-out rounded-md hover:bg-slate-200/60 dark:bg-darkmode-600 dark:hover:bg-darkmode-400 dropdown-item">Unstarred</a>
                            </div>
                        </div>
                    </div>
                    <a class="ml-5 flex h-5 w-5 items-center justify-center" href="#">
                        <i data-tw-merge="" data-lucide="refresh-cw" class="stroke-1.5 h-4 w-4"></i>
                    </a>
                    <a class="ml-5 flex h-5 w-5 items-center justify-center" href="#">
                        <i data-tw-merge="" data-lucide="more-horizontal" class="stroke-1.5 h-4 w-4"></i>
                    </a>
                </div>
                <div class="flex items-center sm:ml-auto">
                    <div class="">1 - 50 of 5,238</div>
                    <a class="ml-5 flex h-5 w-5 items-center justify-center" href="#">
                        <i data-tw-merge="" data-lucide="chevron-left" class="stroke-1.5 h-4 w-4"></i>
                    </a>
                    <a class="ml-5 flex h-5 w-5 items-center justify-center" href="#">
                        <i data-tw-merge="" data-lucide="chevron-right" class="stroke-1.5 h-4 w-4"></i>
                    </a>
                    <a class="ml-5 flex h-5 w-5 items-center justify-center" href="#">
                        <i data-tw-merge="" data-lucide="settings" class="stroke-1.5 h-4 w-4"></i>
                    </a>
                </div>
            </div>
            <div class="overflow-x-auto sm:overflow-x-visible">
                <div class="intro-y">
                    <div class="transition duration-200 ease-in-out transform cursor-pointer inline-block sm:block border-b border-slate-200/60 dark:border-darkmode-400 hover:scale-[1.02] hover:relative hover:z-20 hover:shadow-md hover:border-0 hover:rounded bg-white text-slate-800 dark:text-slate-300 dark:bg-darkmode-600">
                        <div class="flex px-5 py-3">
                            <div class="mr-5 flex w-72 flex-none items-center">
                                <input data-tw-merge="" checked="" type="checkbox" class="transition-all duration-100 ease-in-out shadow-sm cursor-pointer rounded focus:ring-4 focus:ring-offset-0 focus:ring-primary focus:ring-opacity-20 dark:bg-darkmode-800 dark:border-transparent dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&[type='radio']]:checked:bg-primary [&[type='radio']]:checked:border-primary [&[type='radio']]:checked:border-opacity-10 [&[type='checkbox']]:checked:bg-primary [&[type='checkbox']]:checked:border-primary [&[type='checkbox']]:checked:border-opacity-10 [&:disabled:not(:checked)]:bg-slate-100 [&:disabled:not(:checked)]:cursor-not-allowed [&:disabled:not(:checked)]:dark:bg-darkmode-800/50 [&:disabled:checked]:opacity-70 [&:disabled:checked]:cursor-not-allowed [&:disabled:checked]:dark:bg-darkmode-800/50 flex-none border-slate-400 checked:border-primary">
                                <a class="ml-4 flex h-5 w-5 flex-none items-center justify-center text-slate-400" href="#">
                                    <i data-tw-merge="" data-lucide="star" class="stroke-1.5 h-4 w-4"></i>
                                </a>
                                <a class="ml-2 flex h-5 w-5 flex-none items-center justify-center text-slate-400" href="#">
                                    <i data-tw-merge="" data-lucide="bookmark" class="stroke-1.5 h-4 w-4"></i>
                                </a>
                                <div class="image-fit relative ml-5 h-6 w-6 flex-none">
                                    <img class="rounded-full" src="{{asset('dist/images/fakers/profile-3.jpg')}}" alt="Midone - Tailwind Admin Dashboard Template">
                                </div>
                                <div class="ml-3 truncate font-medium">
                                    Robert De Niro
                                </div>
                            </div>
                            <div class="w-64 truncate sm:w-auto">
                                <span class="ml-3 truncate font-medium">
                                    It is a long established fact
                                </span>
                                It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem
                            </div>
                            <div class="pl-10 ml-auto whitespace-nowrap font-medium">
                                01:10 PM
                            </div>
                        </div>
                    </div>
                </div>
                <div class="intro-y">
                    <div class="transition duration-200 ease-in-out transform cursor-pointer inline-block sm:block border-b border-slate-200/60 dark:border-darkmode-400 hover:scale-[1.02] hover:relative hover:z-20 hover:shadow-md hover:border-0 hover:rounded bg-white text-slate-800 dark:text-slate-300 dark:bg-darkmode-600">
                        <div class="flex px-5 py-3">
                            <div class="mr-5 flex w-72 flex-none items-center">
                                <input data-tw-merge="" checked="" type="checkbox" class="transition-all duration-100 ease-in-out shadow-sm cursor-pointer rounded focus:ring-4 focus:ring-offset-0 focus:ring-primary focus:ring-opacity-20 dark:bg-darkmode-800 dark:border-transparent dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&[type='radio']]:checked:bg-primary [&[type='radio']]:checked:border-primary [&[type='radio']]:checked:border-opacity-10 [&[type='checkbox']]:checked:bg-primary [&[type='checkbox']]:checked:border-primary [&[type='checkbox']]:checked:border-opacity-10 [&:disabled:not(:checked)]:bg-slate-100 [&:disabled:not(:checked)]:cursor-not-allowed [&:disabled:not(:checked)]:dark:bg-darkmode-800/50 [&:disabled:checked]:opacity-70 [&:disabled:checked]:cursor-not-allowed [&:disabled:checked]:dark:bg-darkmode-800/50 flex-none border-slate-400 checked:border-primary">
                                <a class="ml-4 flex h-5 w-5 flex-none items-center justify-center text-slate-400" href="#">
                                    <i data-tw-merge="" data-lucide="star" class="stroke-1.5 h-4 w-4"></i>
                                </a>
                                <a class="ml-2 flex h-5 w-5 flex-none items-center justify-center text-slate-400" href="#">
                                    <i data-tw-merge="" data-lucide="bookmark" class="stroke-1.5 h-4 w-4"></i>
                                </a>
                                <div class="image-fit relative ml-5 h-6 w-6 flex-none">
                                    <img class="rounded-full" src="{{asset('dist/images/fakers/profile-3.jpg')}}" alt="Midone - Tailwind Admin Dashboard Template">
                                </div>
                                <div class="ml-3 truncate font-medium">
                                    Sylvester Stallone
                                </div>
                            </div>
                            <div class="w-64 truncate sm:w-auto">
                                <span class="ml-3 truncate font-medium">
                                    There are many variations of passages of Lorem Ips
                                </span>
                                There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomi
                            </div>
                            <div class="pl-10 ml-auto whitespace-nowrap font-medium">
                                01:10 PM
                            </div>
                        </div>
                    </div>
                </div>
                <div class="intro-y">
                    <div class="transition duration-200 ease-in-out transform cursor-pointer inline-block sm:block border-b border-slate-200/60 dark:border-darkmode-400 hover:scale-[1.02] hover:relative hover:z-20 hover:shadow-md hover:border-0 hover:rounded bg-white text-slate-800 dark:text-slate-300 dark:bg-darkmode-600">
                        <div class="flex px-5 py-3">
                            <div class="mr-5 flex w-72 flex-none items-center">
                                <input data-tw-merge="" checked="" type="checkbox" class="transition-all duration-100 ease-in-out shadow-sm cursor-pointer rounded focus:ring-4 focus:ring-offset-0 focus:ring-primary focus:ring-opacity-20 dark:bg-darkmode-800 dark:border-transparent dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&[type='radio']]:checked:bg-primary [&[type='radio']]:checked:border-primary [&[type='radio']]:checked:border-opacity-10 [&[type='checkbox']]:checked:bg-primary [&[type='checkbox']]:checked:border-primary [&[type='checkbox']]:checked:border-opacity-10 [&:disabled:not(:checked)]:bg-slate-100 [&:disabled:not(:checked)]:cursor-not-allowed [&:disabled:not(:checked)]:dark:bg-darkmode-800/50 [&:disabled:checked]:opacity-70 [&:disabled:checked]:cursor-not-allowed [&:disabled:checked]:dark:bg-darkmode-800/50 flex-none border-slate-400 checked:border-primary">
                                <a class="ml-4 flex h-5 w-5 flex-none items-center justify-center text-slate-400" href="#">
                                    <i data-tw-merge="" data-lucide="star" class="stroke-1.5 h-4 w-4"></i>
                                </a>
                                <a class="ml-2 flex h-5 w-5 flex-none items-center justify-center text-slate-400" href="#">
                                    <i data-tw-merge="" data-lucide="bookmark" class="stroke-1.5 h-4 w-4"></i>
                                </a>
                                <div class="image-fit relative ml-5 h-6 w-6 flex-none">
                                    <img class="rounded-full" src="{{asset('dist/images/fakers/profile-11.jpg')}}" alt="Midone - Tailwind Admin Dashboard Template">
                                </div>
                                <div class="ml-3 truncate font-medium">
                                    Tom Cruise
                                </div>
                            </div>
                            <div class="w-64 truncate sm:w-auto">
                                <span class="ml-3 truncate font-medium">
                                    It is a long established fact
                                </span>
                                It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem
                            </div>
                            <div class="pl-10 ml-auto whitespace-nowrap font-medium">
                                05:09 AM
                            </div>
                        </div>
                    </div>
                </div>
                <div class="intro-y">
                    <div class="transition duration-200 ease-in-out transform cursor-pointer inline-block sm:block border-b border-slate-200/60 dark:border-darkmode-400 hover:scale-[1.02] hover:relative hover:z-20 hover:shadow-md hover:border-0 hover:rounded bg-white text-slate-800 dark:text-slate-300 dark:bg-darkmode-600">
                        <div class="flex px-5 py-3">
                            <div class="mr-5 flex w-72 flex-none items-center">
                                <input data-tw-merge="" checked="" type="checkbox" class="transition-all duration-100 ease-in-out shadow-sm cursor-pointer rounded focus:ring-4 focus:ring-offset-0 focus:ring-primary focus:ring-opacity-20 dark:bg-darkmode-800 dark:border-transparent dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&[type='radio']]:checked:bg-primary [&[type='radio']]:checked:border-primary [&[type='radio']]:checked:border-opacity-10 [&[type='checkbox']]:checked:bg-primary [&[type='checkbox']]:checked:border-primary [&[type='checkbox']]:checked:border-opacity-10 [&:disabled:not(:checked)]:bg-slate-100 [&:disabled:not(:checked)]:cursor-not-allowed [&:disabled:not(:checked)]:dark:bg-darkmode-800/50 [&:disabled:checked]:opacity-70 [&:disabled:checked]:cursor-not-allowed [&:disabled:checked]:dark:bg-darkmode-800/50 flex-none border-slate-400 checked:border-primary">
                                <a class="ml-4 flex h-5 w-5 flex-none items-center justify-center text-slate-400" href="#">
                                    <i data-tw-merge="" data-lucide="star" class="stroke-1.5 h-4 w-4"></i>
                                </a>
                                <a class="ml-2 flex h-5 w-5 flex-none items-center justify-center text-slate-400" href="#">
                                    <i data-tw-merge="" data-lucide="bookmark" class="stroke-1.5 h-4 w-4"></i>
                                </a>
                                <div class="image-fit relative ml-5 h-6 w-6 flex-none">
                                    <img class="rounded-full" src="{{asset('dist/images/fakers/profile-15.jpg')}}" alt="Midone - Tailwind Admin Dashboard Template">
                                </div>
                                <div class="ml-3 truncate font-medium">
                                    Sylvester Stallone
                                </div>
                            </div>
                            <div class="w-64 truncate sm:w-auto">
                                <span class="ml-3 truncate font-medium">
                                    Contrary to popular belief, Lo
                                </span>
                                Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 20
                            </div>
                            <div class="pl-10 ml-auto whitespace-nowrap font-medium">
                                05:09 AM
                            </div>
                        </div>
                    </div>
                </div>
                <div class="intro-y">
                    <div class="transition duration-200 ease-in-out transform cursor-pointer inline-block sm:block border-b border-slate-200/60 dark:border-darkmode-400 hover:scale-[1.02] hover:relative hover:z-20 hover:shadow-md hover:border-0 hover:rounded bg-white text-slate-800 dark:text-slate-300 dark:bg-darkmode-600">
                        <div class="flex px-5 py-3">
                            <div class="mr-5 flex w-72 flex-none items-center">
                                <input data-tw-merge="" checked="" type="checkbox" class="transition-all duration-100 ease-in-out shadow-sm cursor-pointer rounded focus:ring-4 focus:ring-offset-0 focus:ring-primary focus:ring-opacity-20 dark:bg-darkmode-800 dark:border-transparent dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&[type='radio']]:checked:bg-primary [&[type='radio']]:checked:border-primary [&[type='radio']]:checked:border-opacity-10 [&[type='checkbox']]:checked:bg-primary [&[type='checkbox']]:checked:border-primary [&[type='checkbox']]:checked:border-opacity-10 [&:disabled:not(:checked)]:bg-slate-100 [&:disabled:not(:checked)]:cursor-not-allowed [&:disabled:not(:checked)]:dark:bg-darkmode-800/50 [&:disabled:checked]:opacity-70 [&:disabled:checked]:cursor-not-allowed [&:disabled:checked]:dark:bg-darkmode-800/50 flex-none border-slate-400 checked:border-primary">
                                <a class="ml-4 flex h-5 w-5 flex-none items-center justify-center text-slate-400" href="#">
                                    <i data-tw-merge="" data-lucide="star" class="stroke-1.5 h-4 w-4"></i>
                                </a>
                                <a class="ml-2 flex h-5 w-5 flex-none items-center justify-center text-slate-400" href="#">
                                    <i data-tw-merge="" data-lucide="bookmark" class="stroke-1.5 h-4 w-4"></i>
                                </a>
                                <div class="image-fit relative ml-5 h-6 w-6 flex-none">
                                    <img class="rounded-full" src="{{asset('dist/images/fakers/profile-12.jpg')}}" alt="Midone - Tailwind Admin Dashboard Template">
                                </div>
                                <div class="ml-3 truncate font-medium">
                                    Bruce Willis
                                </div>
                            </div>
                            <div class="w-64 truncate sm:w-auto">
                                <span class="ml-3 truncate font-medium">
                                    Lorem Ipsum is simply dummy te
                                </span>
                                Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500
                            </div>
                            <div class="pl-10 ml-auto whitespace-nowrap font-medium">
                                01:10 PM
                            </div>
                        </div>
                    </div>
                </div>
                <div class="intro-y">
                    <div class="transition duration-200 ease-in-out transform cursor-pointer inline-block sm:block border-b border-slate-200/60 dark:border-darkmode-400 hover:scale-[1.02] hover:relative hover:z-20 hover:shadow-md hover:border-0 hover:rounded bg-slate-100 text-slate-600 dark:text-slate-500 dark:bg-darkmode-400/70">
                        <div class="flex px-5 py-3">
                            <div class="mr-5 flex w-72 flex-none items-center">
                                <input data-tw-merge="" type="checkbox" class="transition-all duration-100 ease-in-out shadow-sm cursor-pointer rounded focus:ring-4 focus:ring-offset-0 focus:ring-primary focus:ring-opacity-20 dark:bg-darkmode-800 dark:border-transparent dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&[type='radio']]:checked:bg-primary [&[type='radio']]:checked:border-primary [&[type='radio']]:checked:border-opacity-10 [&[type='checkbox']]:checked:bg-primary [&[type='checkbox']]:checked:border-primary [&[type='checkbox']]:checked:border-opacity-10 [&:disabled:not(:checked)]:bg-slate-100 [&:disabled:not(:checked)]:cursor-not-allowed [&:disabled:not(:checked)]:dark:bg-darkmode-800/50 [&:disabled:checked]:opacity-70 [&:disabled:checked]:cursor-not-allowed [&:disabled:checked]:dark:bg-darkmode-800/50 flex-none border-slate-400 checked:border-primary">
                                <a class="ml-4 flex h-5 w-5 flex-none items-center justify-center text-slate-400" href="#">
                                    <i data-tw-merge="" data-lucide="star" class="stroke-1.5 h-4 w-4"></i>
                                </a>
                                <a class="ml-2 flex h-5 w-5 flex-none items-center justify-center text-slate-400" href="#">
                                    <i data-tw-merge="" data-lucide="bookmark" class="stroke-1.5 h-4 w-4"></i>
                                </a>
                                <div class="image-fit relative ml-5 h-6 w-6 flex-none">
                                    <img class="rounded-full" src="{{asset('dist/images/fakers/profile-12.jpg')}}" alt="Midone - Tailwind Admin Dashboard Template">
                                </div>
                                <div class="ml-3 truncate">
                                    Bruce Willis
                                </div>
                            </div>
                            <div class="w-64 truncate sm:w-auto">
                                <span class="ml-3 truncate">
                                    It is a long established fact
                                </span>
                                It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem
                            </div>
                            <div class="pl-10 ml-auto whitespace-nowrap">
                                01:10 PM
                            </div>
                        </div>
                    </div>
                </div>
                <div class="intro-y">
                    <div class="transition duration-200 ease-in-out transform cursor-pointer inline-block sm:block border-b border-slate-200/60 dark:border-darkmode-400 hover:scale-[1.02] hover:relative hover:z-20 hover:shadow-md hover:border-0 hover:rounded bg-slate-100 text-slate-600 dark:text-slate-500 dark:bg-darkmode-400/70">
                        <div class="flex px-5 py-3">
                            <div class="mr-5 flex w-72 flex-none items-center">
                                <input data-tw-merge="" type="checkbox" class="transition-all duration-100 ease-in-out shadow-sm cursor-pointer rounded focus:ring-4 focus:ring-offset-0 focus:ring-primary focus:ring-opacity-20 dark:bg-darkmode-800 dark:border-transparent dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&[type='radio']]:checked:bg-primary [&[type='radio']]:checked:border-primary [&[type='radio']]:checked:border-opacity-10 [&[type='checkbox']]:checked:bg-primary [&[type='checkbox']]:checked:border-primary [&[type='checkbox']]:checked:border-opacity-10 [&:disabled:not(:checked)]:bg-slate-100 [&:disabled:not(:checked)]:cursor-not-allowed [&:disabled:not(:checked)]:dark:bg-darkmode-800/50 [&:disabled:checked]:opacity-70 [&:disabled:checked]:cursor-not-allowed [&:disabled:checked]:dark:bg-darkmode-800/50 flex-none border-slate-400 checked:border-primary">
                                <a class="ml-4 flex h-5 w-5 flex-none items-center justify-center text-slate-400" href="#">
                                    <i data-tw-merge="" data-lucide="star" class="stroke-1.5 h-4 w-4"></i>
                                </a>
                                <a class="ml-2 flex h-5 w-5 flex-none items-center justify-center text-slate-400" href="#">
                                    <i data-tw-merge="" data-lucide="bookmark" class="stroke-1.5 h-4 w-4"></i>
                                </a>
                                <div class="image-fit relative ml-5 h-6 w-6 flex-none">
                                    <img class="rounded-full" src="{{asset('dist/images/fakers/profile-5.jpg')}}" alt="Midone - Tailwind Admin Dashboard Template">
                                </div>
                                <div class="ml-3 truncate">
                                    Russell Crowe
                                </div>
                            </div>
                            <div class="w-64 truncate sm:w-auto">
                                <span class="ml-3 truncate">
                                    There are many variations of passages of Lorem Ips
                                </span>
                                There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomi
                            </div>
                            <div class="pl-10 ml-auto whitespace-nowrap">
                                05:09 AM
                            </div>
                        </div>
                    </div>
                </div>
                <div class="intro-y">
                    <div class="transition duration-200 ease-in-out transform cursor-pointer inline-block sm:block border-b border-slate-200/60 dark:border-darkmode-400 hover:scale-[1.02] hover:relative hover:z-20 hover:shadow-md hover:border-0 hover:rounded bg-white text-slate-800 dark:text-slate-300 dark:bg-darkmode-600">
                        <div class="flex px-5 py-3">
                            <div class="mr-5 flex w-72 flex-none items-center">
                                <input data-tw-merge="" checked="" type="checkbox" class="transition-all duration-100 ease-in-out shadow-sm cursor-pointer rounded focus:ring-4 focus:ring-offset-0 focus:ring-primary focus:ring-opacity-20 dark:bg-darkmode-800 dark:border-transparent dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&[type='radio']]:checked:bg-primary [&[type='radio']]:checked:border-primary [&[type='radio']]:checked:border-opacity-10 [&[type='checkbox']]:checked:bg-primary [&[type='checkbox']]:checked:border-primary [&[type='checkbox']]:checked:border-opacity-10 [&:disabled:not(:checked)]:bg-slate-100 [&:disabled:not(:checked)]:cursor-not-allowed [&:disabled:not(:checked)]:dark:bg-darkmode-800/50 [&:disabled:checked]:opacity-70 [&:disabled:checked]:cursor-not-allowed [&:disabled:checked]:dark:bg-darkmode-800/50 flex-none border-slate-400 checked:border-primary">
                                <a class="ml-4 flex h-5 w-5 flex-none items-center justify-center text-slate-400" href="#">
                                    <i data-tw-merge="" data-lucide="star" class="stroke-1.5 h-4 w-4"></i>
                                </a>
                                <a class="ml-2 flex h-5 w-5 flex-none items-center justify-center text-slate-400" href="#">
                                    <i data-tw-merge="" data-lucide="bookmark" class="stroke-1.5 h-4 w-4"></i>
                                </a>
                                <div class="image-fit relative ml-5 h-6 w-6 flex-none">
                                    <img class="rounded-full" src="{{asset('dist/images/fakers/profile-9.jpg')}}" alt="Midone - Tailwind Admin Dashboard Template">
                                </div>
                                <div class="ml-3 truncate font-medium">
                                    Nicolas Cage
                                </div>
                            </div>
                            <div class="w-64 truncate sm:w-auto">
                                <span class="ml-3 truncate font-medium">
                                    Lorem Ipsum is simply dummy te
                                </span>
                                Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500
                            </div>
                            <div class="pl-10 ml-auto whitespace-nowrap font-medium">
                                01:10 PM
                            </div>
                        </div>
                    </div>
                </div>
                <div class="intro-y">
                    <div class="transition duration-200 ease-in-out transform cursor-pointer inline-block sm:block border-b border-slate-200/60 dark:border-darkmode-400 hover:scale-[1.02] hover:relative hover:z-20 hover:shadow-md hover:border-0 hover:rounded bg-slate-100 text-slate-600 dark:text-slate-500 dark:bg-darkmode-400/70">
                        <div class="flex px-5 py-3">
                            <div class="mr-5 flex w-72 flex-none items-center">
                                <input data-tw-merge="" type="checkbox" class="transition-all duration-100 ease-in-out shadow-sm cursor-pointer rounded focus:ring-4 focus:ring-offset-0 focus:ring-primary focus:ring-opacity-20 dark:bg-darkmode-800 dark:border-transparent dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&[type='radio']]:checked:bg-primary [&[type='radio']]:checked:border-primary [&[type='radio']]:checked:border-opacity-10 [&[type='checkbox']]:checked:bg-primary [&[type='checkbox']]:checked:border-primary [&[type='checkbox']]:checked:border-opacity-10 [&:disabled:not(:checked)]:bg-slate-100 [&:disabled:not(:checked)]:cursor-not-allowed [&:disabled:not(:checked)]:dark:bg-darkmode-800/50 [&:disabled:checked]:opacity-70 [&:disabled:checked]:cursor-not-allowed [&:disabled:checked]:dark:bg-darkmode-800/50 flex-none border-slate-400 checked:border-primary">
                                <a class="ml-4 flex h-5 w-5 flex-none items-center justify-center text-slate-400" href="#">
                                    <i data-tw-merge="" data-lucide="star" class="stroke-1.5 h-4 w-4"></i>
                                </a>
                                <a class="ml-2 flex h-5 w-5 flex-none items-center justify-center text-slate-400" href="#">
                                    <i data-tw-merge="" data-lucide="bookmark" class="stroke-1.5 h-4 w-4"></i>
                                </a>
                                <div class="image-fit relative ml-5 h-6 w-6 flex-none">
                                    <img class="rounded-full" src="{{asset('dist/images/fakers/profile-8.jpg')}}" alt="Midone - Tailwind Admin Dashboard Template">
                                </div>
                                <div class="ml-3 truncate">
                                    Russell Crowe
                                </div>
                            </div>
                            <div class="w-64 truncate sm:w-auto">
                                <span class="ml-3 truncate">
                                    It is a long established fact
                                </span>
                                It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem
                            </div>
                            <div class="pl-10 ml-auto whitespace-nowrap">
                                05:09 AM
                            </div>
                        </div>
                    </div>
                </div>
                <div class="intro-y">
                    <div class="transition duration-200 ease-in-out transform cursor-pointer inline-block sm:block border-b border-slate-200/60 dark:border-darkmode-400 hover:scale-[1.02] hover:relative hover:z-20 hover:shadow-md hover:border-0 hover:rounded bg-white text-slate-800 dark:text-slate-300 dark:bg-darkmode-600">
                        <div class="flex px-5 py-3">
                            <div class="mr-5 flex w-72 flex-none items-center">
                                <input data-tw-merge="" checked="" type="checkbox" class="transition-all duration-100 ease-in-out shadow-sm cursor-pointer rounded focus:ring-4 focus:ring-offset-0 focus:ring-primary focus:ring-opacity-20 dark:bg-darkmode-800 dark:border-transparent dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&[type='radio']]:checked:bg-primary [&[type='radio']]:checked:border-primary [&[type='radio']]:checked:border-opacity-10 [&[type='checkbox']]:checked:bg-primary [&[type='checkbox']]:checked:border-primary [&[type='checkbox']]:checked:border-opacity-10 [&:disabled:not(:checked)]:bg-slate-100 [&:disabled:not(:checked)]:cursor-not-allowed [&:disabled:not(:checked)]:dark:bg-darkmode-800/50 [&:disabled:checked]:opacity-70 [&:disabled:checked]:cursor-not-allowed [&:disabled:checked]:dark:bg-darkmode-800/50 flex-none border-slate-400 checked:border-primary">
                                <a class="ml-4 flex h-5 w-5 flex-none items-center justify-center text-slate-400" href="#">
                                    <i data-tw-merge="" data-lucide="star" class="stroke-1.5 h-4 w-4"></i>
                                </a>
                                <a class="ml-2 flex h-5 w-5 flex-none items-center justify-center text-slate-400" href="#">
                                    <i data-tw-merge="" data-lucide="bookmark" class="stroke-1.5 h-4 w-4"></i>
                                </a>
                                <div class="image-fit relative ml-5 h-6 w-6 flex-none">
                                    <img class="rounded-full" src="{{asset('dist/images/fakers/profile-10.jpg')}}" alt="Midone - Tailwind Admin Dashboard Template">
                                </div>
                                <div class="ml-3 truncate font-medium">
                                    Charlize Theron
                                </div>
                            </div>
                            <div class="w-64 truncate sm:w-auto">
                                <span class="ml-3 truncate font-medium">
                                    Lorem Ipsum is simply dummy te
                                </span>
                                Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500
                            </div>
                            <div class="pl-10 ml-auto whitespace-nowrap font-medium">
                                05:09 AM
                            </div>
                        </div>
                    </div>
                </div>
                <div class="intro-y">
                    <div class="transition duration-200 ease-in-out transform cursor-pointer inline-block sm:block border-b border-slate-200/60 dark:border-darkmode-400 hover:scale-[1.02] hover:relative hover:z-20 hover:shadow-md hover:border-0 hover:rounded bg-white text-slate-800 dark:text-slate-300 dark:bg-darkmode-600">
                        <div class="flex px-5 py-3">
                            <div class="mr-5 flex w-72 flex-none items-center">
                                <input data-tw-merge="" checked="" type="checkbox" class="transition-all duration-100 ease-in-out shadow-sm cursor-pointer rounded focus:ring-4 focus:ring-offset-0 focus:ring-primary focus:ring-opacity-20 dark:bg-darkmode-800 dark:border-transparent dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&[type='radio']]:checked:bg-primary [&[type='radio']]:checked:border-primary [&[type='radio']]:checked:border-opacity-10 [&[type='checkbox']]:checked:bg-primary [&[type='checkbox']]:checked:border-primary [&[type='checkbox']]:checked:border-opacity-10 [&:disabled:not(:checked)]:bg-slate-100 [&:disabled:not(:checked)]:cursor-not-allowed [&:disabled:not(:checked)]:dark:bg-darkmode-800/50 [&:disabled:checked]:opacity-70 [&:disabled:checked]:cursor-not-allowed [&:disabled:checked]:dark:bg-darkmode-800/50 flex-none border-slate-400 checked:border-primary">
                                <a class="ml-4 flex h-5 w-5 flex-none items-center justify-center text-slate-400" href="#">
                                    <i data-tw-merge="" data-lucide="star" class="stroke-1.5 h-4 w-4"></i>
                                </a>
                                <a class="ml-2 flex h-5 w-5 flex-none items-center justify-center text-slate-400" href="#">
                                    <i data-tw-merge="" data-lucide="bookmark" class="stroke-1.5 h-4 w-4"></i>
                                </a>
                                <div class="image-fit relative ml-5 h-6 w-6 flex-none">
                                    <img class="rounded-full" src="{{asset('dist/images/fakers/profile-4.jpg')}}" alt="Midone - Tailwind Admin Dashboard Template">
                                </div>
                                <div class="ml-3 truncate font-medium">
                                    Al Pacino
                                </div>
                            </div>
                            <div class="w-64 truncate sm:w-auto">
                                <span class="ml-3 truncate font-medium">
                                    There are many variations of passages of Lorem Ips
                                </span>
                                There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomi
                            </div>
                            <div class="pl-10 ml-auto whitespace-nowrap font-medium">
                                05:09 AM
                            </div>
                        </div>
                    </div>
                </div>
                <div class="intro-y">
                    <div class="transition duration-200 ease-in-out transform cursor-pointer inline-block sm:block border-b border-slate-200/60 dark:border-darkmode-400 hover:scale-[1.02] hover:relative hover:z-20 hover:shadow-md hover:border-0 hover:rounded bg-white text-slate-800 dark:text-slate-300 dark:bg-darkmode-600">
                        <div class="flex px-5 py-3">
                            <div class="mr-5 flex w-72 flex-none items-center">
                                <input data-tw-merge="" checked="" type="checkbox" class="transition-all duration-100 ease-in-out shadow-sm cursor-pointer rounded focus:ring-4 focus:ring-offset-0 focus:ring-primary focus:ring-opacity-20 dark:bg-darkmode-800 dark:border-transparent dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&[type='radio']]:checked:bg-primary [&[type='radio']]:checked:border-primary [&[type='radio']]:checked:border-opacity-10 [&[type='checkbox']]:checked:bg-primary [&[type='checkbox']]:checked:border-primary [&[type='checkbox']]:checked:border-opacity-10 [&:disabled:not(:checked)]:bg-slate-100 [&:disabled:not(:checked)]:cursor-not-allowed [&:disabled:not(:checked)]:dark:bg-darkmode-800/50 [&:disabled:checked]:opacity-70 [&:disabled:checked]:cursor-not-allowed [&:disabled:checked]:dark:bg-darkmode-800/50 flex-none border-slate-400 checked:border-primary">
                                <a class="ml-4 flex h-5 w-5 flex-none items-center justify-center text-slate-400" href="#">
                                    <i data-tw-merge="" data-lucide="star" class="stroke-1.5 h-4 w-4"></i>
                                </a>
                                <a class="ml-2 flex h-5 w-5 flex-none items-center justify-center text-slate-400" href="#">
                                    <i data-tw-merge="" data-lucide="bookmark" class="stroke-1.5 h-4 w-4"></i>
                                </a>
                                <div class="image-fit relative ml-5 h-6 w-6 flex-none">
                                    <img class="rounded-full" src="{{asset('dist/images/fakers/profile-7.jpg')}}" alt="Midone - Tailwind Admin Dashboard Template">
                                </div>
                                <div class="ml-3 truncate font-medium">
                                    Sylvester Stallone
                                </div>
                            </div>
                            <div class="w-64 truncate sm:w-auto">
                                <span class="ml-3 truncate font-medium">
                                    There are many variations of passages of Lorem Ips
                                </span>
                                There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomi
                            </div>
                            <div class="pl-10 ml-auto whitespace-nowrap font-medium">
                                01:10 PM
                            </div>
                        </div>
                    </div>
                </div>
                <div class="intro-y">
                    <div class="transition duration-200 ease-in-out transform cursor-pointer inline-block sm:block border-b border-slate-200/60 dark:border-darkmode-400 hover:scale-[1.02] hover:relative hover:z-20 hover:shadow-md hover:border-0 hover:rounded bg-white text-slate-800 dark:text-slate-300 dark:bg-darkmode-600">
                        <div class="flex px-5 py-3">
                            <div class="mr-5 flex w-72 flex-none items-center">
                                <input data-tw-merge="" checked="" type="checkbox" class="transition-all duration-100 ease-in-out shadow-sm cursor-pointer rounded focus:ring-4 focus:ring-offset-0 focus:ring-primary focus:ring-opacity-20 dark:bg-darkmode-800 dark:border-transparent dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&[type='radio']]:checked:bg-primary [&[type='radio']]:checked:border-primary [&[type='radio']]:checked:border-opacity-10 [&[type='checkbox']]:checked:bg-primary [&[type='checkbox']]:checked:border-primary [&[type='checkbox']]:checked:border-opacity-10 [&:disabled:not(:checked)]:bg-slate-100 [&:disabled:not(:checked)]:cursor-not-allowed [&:disabled:not(:checked)]:dark:bg-darkmode-800/50 [&:disabled:checked]:opacity-70 [&:disabled:checked]:cursor-not-allowed [&:disabled:checked]:dark:bg-darkmode-800/50 flex-none border-slate-400 checked:border-primary">
                                <a class="ml-4 flex h-5 w-5 flex-none items-center justify-center text-slate-400" href="#">
                                    <i data-tw-merge="" data-lucide="star" class="stroke-1.5 h-4 w-4"></i>
                                </a>
                                <a class="ml-2 flex h-5 w-5 flex-none items-center justify-center text-slate-400" href="#">
                                    <i data-tw-merge="" data-lucide="bookmark" class="stroke-1.5 h-4 w-4"></i>
                                </a>
                                <div class="image-fit relative ml-5 h-6 w-6 flex-none">
                                    <img class="rounded-full" src="{{asset('dist/images/fakers/profile-1.jpg')}}" alt="Midone - Tailwind Admin Dashboard Template">
                                </div>
                                <div class="ml-3 truncate font-medium">
                                    Leonardo DiCaprio
                                </div>
                            </div>
                            <div class="w-64 truncate sm:w-auto">
                                <span class="ml-3 truncate font-medium">
                                    It is a long established fact
                                </span>
                                It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem
                            </div>
                            <div class="pl-10 ml-auto whitespace-nowrap font-medium">
                                01:10 PM
                            </div>
                        </div>
                    </div>
                </div>
                <div class="intro-y">
                    <div class="transition duration-200 ease-in-out transform cursor-pointer inline-block sm:block border-b border-slate-200/60 dark:border-darkmode-400 hover:scale-[1.02] hover:relative hover:z-20 hover:shadow-md hover:border-0 hover:rounded bg-slate-100 text-slate-600 dark:text-slate-500 dark:bg-darkmode-400/70">
                        <div class="flex px-5 py-3">
                            <div class="mr-5 flex w-72 flex-none items-center">
                                <input data-tw-merge="" type="checkbox" class="transition-all duration-100 ease-in-out shadow-sm cursor-pointer rounded focus:ring-4 focus:ring-offset-0 focus:ring-primary focus:ring-opacity-20 dark:bg-darkmode-800 dark:border-transparent dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&[type='radio']]:checked:bg-primary [&[type='radio']]:checked:border-primary [&[type='radio']]:checked:border-opacity-10 [&[type='checkbox']]:checked:bg-primary [&[type='checkbox']]:checked:border-primary [&[type='checkbox']]:checked:border-opacity-10 [&:disabled:not(:checked)]:bg-slate-100 [&:disabled:not(:checked)]:cursor-not-allowed [&:disabled:not(:checked)]:dark:bg-darkmode-800/50 [&:disabled:checked]:opacity-70 [&:disabled:checked]:cursor-not-allowed [&:disabled:checked]:dark:bg-darkmode-800/50 flex-none border-slate-400 checked:border-primary">
                                <a class="ml-4 flex h-5 w-5 flex-none items-center justify-center text-slate-400" href="#">
                                    <i data-tw-merge="" data-lucide="star" class="stroke-1.5 h-4 w-4"></i>
                                </a>
                                <a class="ml-2 flex h-5 w-5 flex-none items-center justify-center text-slate-400" href="#">
                                    <i data-tw-merge="" data-lucide="bookmark" class="stroke-1.5 h-4 w-4"></i>
                                </a>
                                <div class="image-fit relative ml-5 h-6 w-6 flex-none">
                                    <img class="rounded-full" src="{{asset('dist/images/fakers/profile-6.jpg')}}" alt="Midone - Tailwind Admin Dashboard Template">
                                </div>
                                <div class="ml-3 truncate">
                                    Keanu Reeves
                                </div>
                            </div>
                            <div class="w-64 truncate sm:w-auto">
                                <span class="ml-3 truncate">
                                    It is a long established fact
                                </span>
                                It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem
                            </div>
                            <div class="pl-10 ml-auto whitespace-nowrap">
                                01:10 PM
                            </div>
                        </div>
                    </div>
                </div>
                <div class="intro-y">
                    <div class="transition duration-200 ease-in-out transform cursor-pointer inline-block sm:block border-b border-slate-200/60 dark:border-darkmode-400 hover:scale-[1.02] hover:relative hover:z-20 hover:shadow-md hover:border-0 hover:rounded bg-white text-slate-800 dark:text-slate-300 dark:bg-darkmode-600">
                        <div class="flex px-5 py-3">
                            <div class="mr-5 flex w-72 flex-none items-center">
                                <input data-tw-merge="" checked="" type="checkbox" class="transition-all duration-100 ease-in-out shadow-sm cursor-pointer rounded focus:ring-4 focus:ring-offset-0 focus:ring-primary focus:ring-opacity-20 dark:bg-darkmode-800 dark:border-transparent dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&[type='radio']]:checked:bg-primary [&[type='radio']]:checked:border-primary [&[type='radio']]:checked:border-opacity-10 [&[type='checkbox']]:checked:bg-primary [&[type='checkbox']]:checked:border-primary [&[type='checkbox']]:checked:border-opacity-10 [&:disabled:not(:checked)]:bg-slate-100 [&:disabled:not(:checked)]:cursor-not-allowed [&:disabled:not(:checked)]:dark:bg-darkmode-800/50 [&:disabled:checked]:opacity-70 [&:disabled:checked]:cursor-not-allowed [&:disabled:checked]:dark:bg-darkmode-800/50 flex-none border-slate-400 checked:border-primary">
                                <a class="ml-4 flex h-5 w-5 flex-none items-center justify-center text-slate-400" href="#">
                                    <i data-tw-merge="" data-lucide="star" class="stroke-1.5 h-4 w-4"></i>
                                </a>
                                <a class="ml-2 flex h-5 w-5 flex-none items-center justify-center text-slate-400" href="#">
                                    <i data-tw-merge="" data-lucide="bookmark" class="stroke-1.5 h-4 w-4"></i>
                                </a>
                                <div class="image-fit relative ml-5 h-6 w-6 flex-none">
                                    <img class="rounded-full" src="{{asset('dist/images/fakers/profile-9.jpg')}}" alt="Midone - Tailwind Admin Dashboard Template">
                                </div>
                                <div class="ml-3 truncate font-medium">
                                    John Travolta
                                </div>
                            </div>
                            <div class="w-64 truncate sm:w-auto">
                                <span class="ml-3 truncate font-medium">
                                    Lorem Ipsum is simply dummy te
                                </span>
                                Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500
                            </div>
                            <div class="pl-10 ml-auto whitespace-nowrap font-medium">
                                06:05 AM
                            </div>
                        </div>
                    </div>
                </div>
                <div class="intro-y">
                    <div class="transition duration-200 ease-in-out transform cursor-pointer inline-block sm:block border-b border-slate-200/60 dark:border-darkmode-400 hover:scale-[1.02] hover:relative hover:z-20 hover:shadow-md hover:border-0 hover:rounded bg-white text-slate-800 dark:text-slate-300 dark:bg-darkmode-600">
                        <div class="flex px-5 py-3">
                            <div class="mr-5 flex w-72 flex-none items-center">
                                <input data-tw-merge="" checked="" type="checkbox" class="transition-all duration-100 ease-in-out shadow-sm cursor-pointer rounded focus:ring-4 focus:ring-offset-0 focus:ring-primary focus:ring-opacity-20 dark:bg-darkmode-800 dark:border-transparent dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&[type='radio']]:checked:bg-primary [&[type='radio']]:checked:border-primary [&[type='radio']]:checked:border-opacity-10 [&[type='checkbox']]:checked:bg-primary [&[type='checkbox']]:checked:border-primary [&[type='checkbox']]:checked:border-opacity-10 [&:disabled:not(:checked)]:bg-slate-100 [&:disabled:not(:checked)]:cursor-not-allowed [&:disabled:not(:checked)]:dark:bg-darkmode-800/50 [&:disabled:checked]:opacity-70 [&:disabled:checked]:cursor-not-allowed [&:disabled:checked]:dark:bg-darkmode-800/50 flex-none border-slate-400 checked:border-primary">
                                <a class="ml-4 flex h-5 w-5 flex-none items-center justify-center text-slate-400" href="#">
                                    <i data-tw-merge="" data-lucide="star" class="stroke-1.5 h-4 w-4"></i>
                                </a>
                                <a class="ml-2 flex h-5 w-5 flex-none items-center justify-center text-slate-400" href="#">
                                    <i data-tw-merge="" data-lucide="bookmark" class="stroke-1.5 h-4 w-4"></i>
                                </a>
                                <div class="image-fit relative ml-5 h-6 w-6 flex-none">
                                    <img class="rounded-full" src="{{asset('dist/images/fakers/profile-4.jpg')}}" alt="Midone - Tailwind Admin Dashboard Template">
                                </div>
                                <div class="ml-3 truncate font-medium">
                                    Johnny Depp
                                </div>
                            </div>
                            <div class="w-64 truncate sm:w-auto">
                                <span class="ml-3 truncate font-medium">
                                    Lorem Ipsum is simply dummy te
                                </span>
                                Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500
                            </div>
                            <div class="pl-10 ml-auto whitespace-nowrap font-medium">
                                01:10 PM
                            </div>
                        </div>
                    </div>
                </div>
                <div class="intro-y">
                    <div class="transition duration-200 ease-in-out transform cursor-pointer inline-block sm:block border-b border-slate-200/60 dark:border-darkmode-400 hover:scale-[1.02] hover:relative hover:z-20 hover:shadow-md hover:border-0 hover:rounded bg-slate-100 text-slate-600 dark:text-slate-500 dark:bg-darkmode-400/70">
                        <div class="flex px-5 py-3">
                            <div class="mr-5 flex w-72 flex-none items-center">
                                <input data-tw-merge="" type="checkbox" class="transition-all duration-100 ease-in-out shadow-sm cursor-pointer rounded focus:ring-4 focus:ring-offset-0 focus:ring-primary focus:ring-opacity-20 dark:bg-darkmode-800 dark:border-transparent dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&[type='radio']]:checked:bg-primary [&[type='radio']]:checked:border-primary [&[type='radio']]:checked:border-opacity-10 [&[type='checkbox']]:checked:bg-primary [&[type='checkbox']]:checked:border-primary [&[type='checkbox']]:checked:border-opacity-10 [&:disabled:not(:checked)]:bg-slate-100 [&:disabled:not(:checked)]:cursor-not-allowed [&:disabled:not(:checked)]:dark:bg-darkmode-800/50 [&:disabled:checked]:opacity-70 [&:disabled:checked]:cursor-not-allowed [&:disabled:checked]:dark:bg-darkmode-800/50 flex-none border-slate-400 checked:border-primary">
                                <a class="ml-4 flex h-5 w-5 flex-none items-center justify-center text-slate-400" href="#">
                                    <i data-tw-merge="" data-lucide="star" class="stroke-1.5 h-4 w-4"></i>
                                </a>
                                <a class="ml-2 flex h-5 w-5 flex-none items-center justify-center text-slate-400" href="#">
                                    <i data-tw-merge="" data-lucide="bookmark" class="stroke-1.5 h-4 w-4"></i>
                                </a>
                                <div class="image-fit relative ml-5 h-6 w-6 flex-none">
                                    <img class="rounded-full" src="{{asset('dist/images/fakers/profile-3.jpg')}}" alt="Midone - Tailwind Admin Dashboard Template">
                                </div>
                                <div class="ml-3 truncate">
                                    Brad Pitt
                                </div>
                            </div>
                            <div class="w-64 truncate sm:w-auto">
                                <span class="ml-3 truncate">
                                    There are many variations of passages of Lorem Ips
                                </span>
                                There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomi
                            </div>
                            <div class="pl-10 ml-auto whitespace-nowrap">
                                01:10 PM
                            </div>
                        </div>
                    </div>
                </div>
                <div class="intro-y">
                    <div class="transition duration-200 ease-in-out transform cursor-pointer inline-block sm:block border-b border-slate-200/60 dark:border-darkmode-400 hover:scale-[1.02] hover:relative hover:z-20 hover:shadow-md hover:border-0 hover:rounded bg-white text-slate-800 dark:text-slate-300 dark:bg-darkmode-600">
                        <div class="flex px-5 py-3">
                            <div class="mr-5 flex w-72 flex-none items-center">
                                <input data-tw-merge="" checked="" type="checkbox" class="transition-all duration-100 ease-in-out shadow-sm cursor-pointer rounded focus:ring-4 focus:ring-offset-0 focus:ring-primary focus:ring-opacity-20 dark:bg-darkmode-800 dark:border-transparent dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&[type='radio']]:checked:bg-primary [&[type='radio']]:checked:border-primary [&[type='radio']]:checked:border-opacity-10 [&[type='checkbox']]:checked:bg-primary [&[type='checkbox']]:checked:border-primary [&[type='checkbox']]:checked:border-opacity-10 [&:disabled:not(:checked)]:bg-slate-100 [&:disabled:not(:checked)]:cursor-not-allowed [&:disabled:not(:checked)]:dark:bg-darkmode-800/50 [&:disabled:checked]:opacity-70 [&:disabled:checked]:cursor-not-allowed [&:disabled:checked]:dark:bg-darkmode-800/50 flex-none border-slate-400 checked:border-primary">
                                <a class="ml-4 flex h-5 w-5 flex-none items-center justify-center text-slate-400" href="#">
                                    <i data-tw-merge="" data-lucide="star" class="stroke-1.5 h-4 w-4"></i>
                                </a>
                                <a class="ml-2 flex h-5 w-5 flex-none items-center justify-center text-slate-400" href="#">
                                    <i data-tw-merge="" data-lucide="bookmark" class="stroke-1.5 h-4 w-4"></i>
                                </a>
                                <div class="image-fit relative ml-5 h-6 w-6 flex-none">
                                    <img class="rounded-full" src="{{asset('dist/images/fakers/profile-4.jpg')}}" alt="Midone - Tailwind Admin Dashboard Template">
                                </div>
                                <div class="ml-3 truncate font-medium">
                                    Angelina Jolie
                                </div>
                            </div>
                            <div class="w-64 truncate sm:w-auto">
                                <span class="ml-3 truncate font-medium">
                                    There are many variations of passages of Lorem Ips
                                </span>
                                There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomi
                            </div>
                            <div class="pl-10 ml-auto whitespace-nowrap font-medium">
                                01:10 PM
                            </div>
                        </div>
                    </div>
                </div>
                <div class="intro-y">
                    <div class="transition duration-200 ease-in-out transform cursor-pointer inline-block sm:block border-b border-slate-200/60 dark:border-darkmode-400 hover:scale-[1.02] hover:relative hover:z-20 hover:shadow-md hover:border-0 hover:rounded bg-slate-100 text-slate-600 dark:text-slate-500 dark:bg-darkmode-400/70">
                        <div class="flex px-5 py-3">
                            <div class="mr-5 flex w-72 flex-none items-center">
                                <input data-tw-merge="" type="checkbox" class="transition-all duration-100 ease-in-out shadow-sm cursor-pointer rounded focus:ring-4 focus:ring-offset-0 focus:ring-primary focus:ring-opacity-20 dark:bg-darkmode-800 dark:border-transparent dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&[type='radio']]:checked:bg-primary [&[type='radio']]:checked:border-primary [&[type='radio']]:checked:border-opacity-10 [&[type='checkbox']]:checked:bg-primary [&[type='checkbox']]:checked:border-primary [&[type='checkbox']]:checked:border-opacity-10 [&:disabled:not(:checked)]:bg-slate-100 [&:disabled:not(:checked)]:cursor-not-allowed [&:disabled:not(:checked)]:dark:bg-darkmode-800/50 [&:disabled:checked]:opacity-70 [&:disabled:checked]:cursor-not-allowed [&:disabled:checked]:dark:bg-darkmode-800/50 flex-none border-slate-400 checked:border-primary">
                                <a class="ml-4 flex h-5 w-5 flex-none items-center justify-center text-slate-400" href="#">
                                    <i data-tw-merge="" data-lucide="star" class="stroke-1.5 h-4 w-4"></i>
                                </a>
                                <a class="ml-2 flex h-5 w-5 flex-none items-center justify-center text-slate-400" href="#">
                                    <i data-tw-merge="" data-lucide="bookmark" class="stroke-1.5 h-4 w-4"></i>
                                </a>
                                <div class="image-fit relative ml-5 h-6 w-6 flex-none">
                                    <img class="rounded-full" src="{{asset('dist/images/fakers/profile-13.jpg')}}" alt="Midone - Tailwind Admin Dashboard Template">
                                </div>
                                <div class="ml-3 truncate">
                                    Robert De Niro
                                </div>
                            </div>
                            <div class="w-64 truncate sm:w-auto">
                                <span class="ml-3 truncate">
                                    Contrary to popular belief, Lo
                                </span>
                                Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 20
                            </div>
                            <div class="pl-10 ml-auto whitespace-nowrap">
                                06:05 AM
                            </div>
                        </div>
                    </div>
                </div>
                <div class="intro-y">
                    <div class="transition duration-200 ease-in-out transform cursor-pointer inline-block sm:block border-b border-slate-200/60 dark:border-darkmode-400 hover:scale-[1.02] hover:relative hover:z-20 hover:shadow-md hover:border-0 hover:rounded bg-white text-slate-800 dark:text-slate-300 dark:bg-darkmode-600">
                        <div class="flex px-5 py-3">
                            <div class="mr-5 flex w-72 flex-none items-center">
                                <input data-tw-merge="" checked="" type="checkbox" class="transition-all duration-100 ease-in-out shadow-sm cursor-pointer rounded focus:ring-4 focus:ring-offset-0 focus:ring-primary focus:ring-opacity-20 dark:bg-darkmode-800 dark:border-transparent dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&[type='radio']]:checked:bg-primary [&[type='radio']]:checked:border-primary [&[type='radio']]:checked:border-opacity-10 [&[type='checkbox']]:checked:bg-primary [&[type='checkbox']]:checked:border-primary [&[type='checkbox']]:checked:border-opacity-10 [&:disabled:not(:checked)]:bg-slate-100 [&:disabled:not(:checked)]:cursor-not-allowed [&:disabled:not(:checked)]:dark:bg-darkmode-800/50 [&:disabled:checked]:opacity-70 [&:disabled:checked]:cursor-not-allowed [&:disabled:checked]:dark:bg-darkmode-800/50 flex-none border-slate-400 checked:border-primary">
                                <a class="ml-4 flex h-5 w-5 flex-none items-center justify-center text-slate-400" href="#">
                                    <i data-tw-merge="" data-lucide="star" class="stroke-1.5 h-4 w-4"></i>
                                </a>
                                <a class="ml-2 flex h-5 w-5 flex-none items-center justify-center text-slate-400" href="#">
                                    <i data-tw-merge="" data-lucide="bookmark" class="stroke-1.5 h-4 w-4"></i>
                                </a>
                                <div class="image-fit relative ml-5 h-6 w-6 flex-none">
                                    <img class="rounded-full" src="{{asset('dist/images/fakers/profile-11.jpg')}}" alt="Midone - Tailwind Admin Dashboard Template">
                                </div>
                                <div class="ml-3 truncate font-medium">
                                    Tom Cruise
                                </div>
                            </div>
                            <div class="w-64 truncate sm:w-auto">
                                <span class="ml-3 truncate font-medium">
                                    Lorem Ipsum is simply dummy te
                                </span>
                                Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500
                            </div>
                            <div class="pl-10 ml-auto whitespace-nowrap font-medium">
                                06:05 AM
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="flex flex-col items-center p-5 text-center text-slate-500 sm:flex-row sm:text-left">
                <div>4.41 GB (25%) of 17 GB used Manage</div>
                <div class="mt-2 sm:ml-auto sm:mt-0">
                    Last account activity: 36 minutes ago
                </div>
            </div>
        </div>
        <!-- END: Inbox Content -->
    </div>
</div>
@endsection
@section('addition_css')
@endsection
@section('addition_script')
@endsection