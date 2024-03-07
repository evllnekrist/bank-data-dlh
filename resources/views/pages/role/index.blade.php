@extends('layouts.app-enigma')
@section('title', 'File Manager')
@section('content')
    <h2 class="intro-y mt-10 text-lg font-medium">Kelola Akses</h2>
    <div class="mt-5 grid grid-cols-12 gap-6">
        <div class="intro-y col-span-12 mt-2 flex flex-wrap items-center sm:flex-nowrap">
            <button data-tw-merge="" class="transition duration-200 border inline-flex items-center justify-center py-2 px-3 rounded-md font-medium cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed bg-primary border-primary text-white dark:border-primary mr-2 shadow-md">Add New User</button>
            <div data-tw-merge="" data-tw-placement="bottom-end" class="dropdown relative"><button data-tw-merge="" data-tw-toggle="dropdown" aria-expanded="false" class="transition duration-200 border shadow-sm inline-flex items-center justify-center py-2 rounded-md font-medium cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed !box px-2"><span class="flex h-5 w-5 items-center justify-center">
                        <i data-tw-merge="" data-lucide="plus" class="stroke-1.5 h-4 w-4"></i>
                    </span></button>
                <div data-transition="" data-selector=".show" data-enter="transition-all ease-linear duration-150" data-enter-from="absolute !mt-5 invisible opacity-0 translate-y-1" data-enter-to="!mt-1 visible opacity-100 translate-y-0" data-leave="transition-all ease-linear duration-150" data-leave-from="!mt-1 visible opacity-100 translate-y-0" data-leave-to="absolute !mt-5 invisible opacity-0 translate-y-1" class="dropdown-menu absolute z-[9999] hidden">
                    <div data-tw-merge="" class="dropdown-content rounded-md border-transparent bg-white p-2 shadow-[0px_3px_10px_#00000017] dark:border-transparent dark:bg-darkmode-600 w-40">
                        <a class="cursor-pointer flex items-center p-2 transition duration-300 ease-in-out rounded-md hover:bg-slate-200/60 dark:bg-darkmode-600 dark:hover:bg-darkmode-400 dropdown-item"><i data-tw-merge="" data-lucide="users" class="stroke-1.5 mr-2 h-4 w-4"></i>
                            Add Group</a>
                        <a class="cursor-pointer flex items-center p-2 transition duration-300 ease-in-out rounded-md hover:bg-slate-200/60 dark:bg-darkmode-600 dark:hover:bg-darkmode-400 dropdown-item"><i data-tw-merge="" data-lucide="message-circle" class="stroke-1.5 mr-2 h-4 w-4"></i>
                            Send
                            Message</a>
                    </div>
                </div>
            </div>
            <div class="mx-auto hidden text-slate-500 md:block">
                Showing 1 to 10 of 150 entries
            </div>
            <div class="mt-3 w-full sm:ml-auto sm:mt-0 sm:w-auto md:ml-0">
                <div class="relative w-56 text-slate-500">
                    <input data-tw-merge="" type="text" placeholder="Search..." class="disabled:bg-slate-100 disabled:cursor-not-allowed dark:disabled:bg-darkmode-800/50 dark:disabled:border-transparent [&[readonly]]:bg-slate-100 [&[readonly]]:cursor-not-allowed [&[readonly]]:dark:bg-darkmode-800/50 [&[readonly]]:dark:border-transparent transition duration-200 ease-in-out text-sm border-slate-200 shadow-sm rounded-md placeholder:text-slate-400/90 focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus:border-primary focus:border-opacity-40 dark:bg-darkmode-800 dark:border-transparent dark:focus:ring-slate-700 dark:focus:ring-opacity-50 dark:placeholder:text-slate-500/80 group-[.form-inline]:flex-1 group-[.input-group]:rounded-none group-[.input-group]:[&:not(:first-child)]:border-l-transparent group-[.input-group]:first:rounded-l group-[.input-group]:last:rounded-r group-[.input-group]:z-10 !box w-56 pr-10">
                    <i data-tw-merge="" data-lucide="search" class="stroke-1.5 absolute inset-y-0 right-0 my-auto mr-3 h-4 w-4"></i>
                </div>
            </div>
        </div>
        <!-- BEGIN: Users Layout -->
        <div class="intro-y col-span-12 md:col-span-6">
            <div class="box">
                <div class="flex flex-col items-center p-5 lg:flex-row">
                    <div class="image-fit h-24 w-24 lg:mr-1 lg:h-12 lg:w-12">
                        <img class="rounded-full" src="dist/images/fakers/profile-4.jpg" alt="Midone - Tailwind Admin Dashboard Template">
                    </div>
                    <div class="mt-3 text-center lg:ml-2 lg:mr-auto lg:mt-0 lg:text-left">
                        <a class="font-medium" href="">
                            Denzel Washington
                        </a>
                        <div class="mt-0.5 text-xs text-slate-500">
                            Software Engineer
                        </div>
                    </div>
                    <div class="mt-4 flex lg:mt-0">
                        <button data-tw-merge="" class="transition duration-200 border shadow-sm inline-flex items-center justify-center rounded-md font-medium cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed bg-primary border-primary text-white dark:border-primary mr-2 px-2 py-1">Message</button>
                        <button data-tw-merge="" class="transition duration-200 border shadow-sm inline-flex items-center justify-center rounded-md font-medium cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed border-secondary text-slate-500 dark:border-darkmode-100/40 dark:text-slate-300 [&:hover:not(:disabled)]:bg-secondary/20 [&:hover:not(:disabled)]:dark:bg-darkmode-100/10 px-2 py-1">Profile</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="intro-y col-span-12 md:col-span-6">
            <div class="box">
                <div class="flex flex-col items-center p-5 lg:flex-row">
                    <div class="image-fit h-24 w-24 lg:mr-1 lg:h-12 lg:w-12">
                        <img class="rounded-full" src="dist/images/fakers/profile-5.jpg" alt="Midone - Tailwind Admin Dashboard Template">
                    </div>
                    <div class="mt-3 text-center lg:ml-2 lg:mr-auto lg:mt-0 lg:text-left">
                        <a class="font-medium" href="">
                            Bruce Willis
                        </a>
                        <div class="mt-0.5 text-xs text-slate-500">
                            DevOps Engineer
                        </div>
                    </div>
                    <div class="mt-4 flex lg:mt-0">
                        <button data-tw-merge="" class="transition duration-200 border shadow-sm inline-flex items-center justify-center rounded-md font-medium cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed bg-primary border-primary text-white dark:border-primary mr-2 px-2 py-1">Message</button>
                        <button data-tw-merge="" class="transition duration-200 border shadow-sm inline-flex items-center justify-center rounded-md font-medium cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed border-secondary text-slate-500 dark:border-darkmode-100/40 dark:text-slate-300 [&:hover:not(:disabled)]:bg-secondary/20 [&:hover:not(:disabled)]:dark:bg-darkmode-100/10 px-2 py-1">Profile</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="intro-y col-span-12 md:col-span-6">
            <div class="box">
                <div class="flex flex-col items-center p-5 lg:flex-row">
                    <div class="image-fit h-24 w-24 lg:mr-1 lg:h-12 lg:w-12">
                        <img class="rounded-full" src="dist/images/fakers/profile-9.jpg" alt="Midone - Tailwind Admin Dashboard Template">
                    </div>
                    <div class="mt-3 text-center lg:ml-2 lg:mr-auto lg:mt-0 lg:text-left">
                        <a class="font-medium" href="">
                            Robert De Niro
                        </a>
                        <div class="mt-0.5 text-xs text-slate-500">
                            Backend Engineer
                        </div>
                    </div>
                    <div class="mt-4 flex lg:mt-0">
                        <button data-tw-merge="" class="transition duration-200 border shadow-sm inline-flex items-center justify-center rounded-md font-medium cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed bg-primary border-primary text-white dark:border-primary mr-2 px-2 py-1">Message</button>
                        <button data-tw-merge="" class="transition duration-200 border shadow-sm inline-flex items-center justify-center rounded-md font-medium cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed border-secondary text-slate-500 dark:border-darkmode-100/40 dark:text-slate-300 [&:hover:not(:disabled)]:bg-secondary/20 [&:hover:not(:disabled)]:dark:bg-darkmode-100/10 px-2 py-1">Profile</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="intro-y col-span-12 md:col-span-6">
            <div class="box">
                <div class="flex flex-col items-center p-5 lg:flex-row">
                    <div class="image-fit h-24 w-24 lg:mr-1 lg:h-12 lg:w-12">
                        <img class="rounded-full" src="dist/images/fakers/profile-2.jpg" alt="Midone - Tailwind Admin Dashboard Template">
                    </div>
                    <div class="mt-3 text-center lg:ml-2 lg:mr-auto lg:mt-0 lg:text-left">
                        <a class="font-medium" href="">
                            John Travolta
                        </a>
                        <div class="mt-0.5 text-xs text-slate-500">
                            Frontend Engineer
                        </div>
                    </div>
                    <div class="mt-4 flex lg:mt-0">
                        <button data-tw-merge="" class="transition duration-200 border shadow-sm inline-flex items-center justify-center rounded-md font-medium cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed bg-primary border-primary text-white dark:border-primary mr-2 px-2 py-1">Message</button>
                        <button data-tw-merge="" class="transition duration-200 border shadow-sm inline-flex items-center justify-center rounded-md font-medium cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed border-secondary text-slate-500 dark:border-darkmode-100/40 dark:text-slate-300 [&:hover:not(:disabled)]:bg-secondary/20 [&:hover:not(:disabled)]:dark:bg-darkmode-100/10 px-2 py-1">Profile</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="intro-y col-span-12 md:col-span-6">
            <div class="box">
                <div class="flex flex-col items-center p-5 lg:flex-row">
                    <div class="image-fit h-24 w-24 lg:mr-1 lg:h-12 lg:w-12">
                        <img class="rounded-full" src="dist/images/fakers/profile-14.jpg" alt="Midone - Tailwind Admin Dashboard Template">
                    </div>
                    <div class="mt-3 text-center lg:ml-2 lg:mr-auto lg:mt-0 lg:text-left">
                        <a class="font-medium" href="">
                            Johnny Depp
                        </a>
                        <div class="mt-0.5 text-xs text-slate-500">
                            DevOps Engineer
                        </div>
                    </div>
                    <div class="mt-4 flex lg:mt-0">
                        <button data-tw-merge="" class="transition duration-200 border shadow-sm inline-flex items-center justify-center rounded-md font-medium cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed bg-primary border-primary text-white dark:border-primary mr-2 px-2 py-1">Message</button>
                        <button data-tw-merge="" class="transition duration-200 border shadow-sm inline-flex items-center justify-center rounded-md font-medium cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed border-secondary text-slate-500 dark:border-darkmode-100/40 dark:text-slate-300 [&:hover:not(:disabled)]:bg-secondary/20 [&:hover:not(:disabled)]:dark:bg-darkmode-100/10 px-2 py-1">Profile</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="intro-y col-span-12 md:col-span-6">
            <div class="box">
                <div class="flex flex-col items-center p-5 lg:flex-row">
                    <div class="image-fit h-24 w-24 lg:mr-1 lg:h-12 lg:w-12">
                        <img class="rounded-full" src="dist/images/fakers/profile-14.jpg" alt="Midone - Tailwind Admin Dashboard Template">
                    </div>
                    <div class="mt-3 text-center lg:ml-2 lg:mr-auto lg:mt-0 lg:text-left">
                        <a class="font-medium" href="">
                            Kate Winslet
                        </a>
                        <div class="mt-0.5 text-xs text-slate-500">
                            DevOps Engineer
                        </div>
                    </div>
                    <div class="mt-4 flex lg:mt-0">
                        <button data-tw-merge="" class="transition duration-200 border shadow-sm inline-flex items-center justify-center rounded-md font-medium cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed bg-primary border-primary text-white dark:border-primary mr-2 px-2 py-1">Message</button>
                        <button data-tw-merge="" class="transition duration-200 border shadow-sm inline-flex items-center justify-center rounded-md font-medium cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed border-secondary text-slate-500 dark:border-darkmode-100/40 dark:text-slate-300 [&:hover:not(:disabled)]:bg-secondary/20 [&:hover:not(:disabled)]:dark:bg-darkmode-100/10 px-2 py-1">Profile</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="intro-y col-span-12 md:col-span-6">
            <div class="box">
                <div class="flex flex-col items-center p-5 lg:flex-row">
                    <div class="image-fit h-24 w-24 lg:mr-1 lg:h-12 lg:w-12">
                        <img class="rounded-full" src="dist/images/fakers/profile-4.jpg" alt="Midone - Tailwind Admin Dashboard Template">
                    </div>
                    <div class="mt-3 text-center lg:ml-2 lg:mr-auto lg:mt-0 lg:text-left">
                        <a class="font-medium" href="">
                            Kevin Spacey
                        </a>
                        <div class="mt-0.5 text-xs text-slate-500">
                            Frontend Engineer
                        </div>
                    </div>
                    <div class="mt-4 flex lg:mt-0">
                        <button data-tw-merge="" class="transition duration-200 border shadow-sm inline-flex items-center justify-center rounded-md font-medium cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed bg-primary border-primary text-white dark:border-primary mr-2 px-2 py-1">Message</button>
                        <button data-tw-merge="" class="transition duration-200 border shadow-sm inline-flex items-center justify-center rounded-md font-medium cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed border-secondary text-slate-500 dark:border-darkmode-100/40 dark:text-slate-300 [&:hover:not(:disabled)]:bg-secondary/20 [&:hover:not(:disabled)]:dark:bg-darkmode-100/10 px-2 py-1">Profile</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="intro-y col-span-12 md:col-span-6">
            <div class="box">
                <div class="flex flex-col items-center p-5 lg:flex-row">
                    <div class="image-fit h-24 w-24 lg:mr-1 lg:h-12 lg:w-12">
                        <img class="rounded-full" src="dist/images/fakers/profile-14.jpg" alt="Midone - Tailwind Admin Dashboard Template">
                    </div>
                    <div class="mt-3 text-center lg:ml-2 lg:mr-auto lg:mt-0 lg:text-left">
                        <a class="font-medium" href="">
                            Russell Crowe
                        </a>
                        <div class="mt-0.5 text-xs text-slate-500">
                            DevOps Engineer
                        </div>
                    </div>
                    <div class="mt-4 flex lg:mt-0">
                        <button data-tw-merge="" class="transition duration-200 border shadow-sm inline-flex items-center justify-center rounded-md font-medium cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed bg-primary border-primary text-white dark:border-primary mr-2 px-2 py-1">Message</button>
                        <button data-tw-merge="" class="transition duration-200 border shadow-sm inline-flex items-center justify-center rounded-md font-medium cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed border-secondary text-slate-500 dark:border-darkmode-100/40 dark:text-slate-300 [&:hover:not(:disabled)]:bg-secondary/20 [&:hover:not(:disabled)]:dark:bg-darkmode-100/10 px-2 py-1">Profile</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="intro-y col-span-12 md:col-span-6">
            <div class="box">
                <div class="flex flex-col items-center p-5 lg:flex-row">
                    <div class="image-fit h-24 w-24 lg:mr-1 lg:h-12 lg:w-12">
                        <img class="rounded-full" src="dist/images/fakers/profile-1.jpg" alt="Midone - Tailwind Admin Dashboard Template">
                    </div>
                    <div class="mt-3 text-center lg:ml-2 lg:mr-auto lg:mt-0 lg:text-left">
                        <a class="font-medium" href="">
                            Al Pacino
                        </a>
                        <div class="mt-0.5 text-xs text-slate-500">
                            Frontend Engineer
                        </div>
                    </div>
                    <div class="mt-4 flex lg:mt-0">
                        <button data-tw-merge="" class="transition duration-200 border shadow-sm inline-flex items-center justify-center rounded-md font-medium cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed bg-primary border-primary text-white dark:border-primary mr-2 px-2 py-1">Message</button>
                        <button data-tw-merge="" class="transition duration-200 border shadow-sm inline-flex items-center justify-center rounded-md font-medium cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed border-secondary text-slate-500 dark:border-darkmode-100/40 dark:text-slate-300 [&:hover:not(:disabled)]:bg-secondary/20 [&:hover:not(:disabled)]:dark:bg-darkmode-100/10 px-2 py-1">Profile</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="intro-y col-span-12 md:col-span-6">
            <div class="box">
                <div class="flex flex-col items-center p-5 lg:flex-row">
                    <div class="image-fit h-24 w-24 lg:mr-1 lg:h-12 lg:w-12">
                        <img class="rounded-full" src="dist/images/fakers/profile-8.jpg" alt="Midone - Tailwind Admin Dashboard Template">
                    </div>
                    <div class="mt-3 text-center lg:ml-2 lg:mr-auto lg:mt-0 lg:text-left">
                        <a class="font-medium" href="">
                            Morgan Freeman
                        </a>
                        <div class="mt-0.5 text-xs text-slate-500">
                            Backend Engineer
                        </div>
                    </div>
                    <div class="mt-4 flex lg:mt-0">
                        <button data-tw-merge="" class="transition duration-200 border shadow-sm inline-flex items-center justify-center rounded-md font-medium cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed bg-primary border-primary text-white dark:border-primary mr-2 px-2 py-1">Message</button>
                        <button data-tw-merge="" class="transition duration-200 border shadow-sm inline-flex items-center justify-center rounded-md font-medium cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed border-secondary text-slate-500 dark:border-darkmode-100/40 dark:text-slate-300 [&:hover:not(:disabled)]:bg-secondary/20 [&:hover:not(:disabled)]:dark:bg-darkmode-100/10 px-2 py-1">Profile</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="intro-y col-span-12 md:col-span-6">
            <div class="box">
                <div class="flex flex-col items-center p-5 lg:flex-row">
                    <div class="image-fit h-24 w-24 lg:mr-1 lg:h-12 lg:w-12">
                        <img class="rounded-full" src="dist/images/fakers/profile-8.jpg" alt="Midone - Tailwind Admin Dashboard Template">
                    </div>
                    <div class="mt-3 text-center lg:ml-2 lg:mr-auto lg:mt-0 lg:text-left">
                        <a class="font-medium" href="">
                            Sylvester Stallone
                        </a>
                        <div class="mt-0.5 text-xs text-slate-500">
                            Frontend Engineer
                        </div>
                    </div>
                    <div class="mt-4 flex lg:mt-0">
                        <button data-tw-merge="" class="transition duration-200 border shadow-sm inline-flex items-center justify-center rounded-md font-medium cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed bg-primary border-primary text-white dark:border-primary mr-2 px-2 py-1">Message</button>
                        <button data-tw-merge="" class="transition duration-200 border shadow-sm inline-flex items-center justify-center rounded-md font-medium cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed border-secondary text-slate-500 dark:border-darkmode-100/40 dark:text-slate-300 [&:hover:not(:disabled)]:bg-secondary/20 [&:hover:not(:disabled)]:dark:bg-darkmode-100/10 px-2 py-1">Profile</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="intro-y col-span-12 md:col-span-6">
            <div class="box">
                <div class="flex flex-col items-center p-5 lg:flex-row">
                    <div class="image-fit h-24 w-24 lg:mr-1 lg:h-12 lg:w-12">
                        <img class="rounded-full" src="dist/images/fakers/profile-3.jpg" alt="Midone - Tailwind Admin Dashboard Template">
                    </div>
                    <div class="mt-3 text-center lg:ml-2 lg:mr-auto lg:mt-0 lg:text-left">
                        <a class="font-medium" href="">
                            Hugh Jackman
                        </a>
                        <div class="mt-0.5 text-xs text-slate-500">
                            Software Engineer
                        </div>
                    </div>
                    <div class="mt-4 flex lg:mt-0">
                        <button data-tw-merge="" class="transition duration-200 border shadow-sm inline-flex items-center justify-center rounded-md font-medium cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed bg-primary border-primary text-white dark:border-primary mr-2 px-2 py-1">Message</button>
                        <button data-tw-merge="" class="transition duration-200 border shadow-sm inline-flex items-center justify-center rounded-md font-medium cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed border-secondary text-slate-500 dark:border-darkmode-100/40 dark:text-slate-300 [&:hover:not(:disabled)]:bg-secondary/20 [&:hover:not(:disabled)]:dark:bg-darkmode-100/10 px-2 py-1">Profile</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="intro-y col-span-12 md:col-span-6">
            <div class="box">
                <div class="flex flex-col items-center p-5 lg:flex-row">
                    <div class="image-fit h-24 w-24 lg:mr-1 lg:h-12 lg:w-12">
                        <img class="rounded-full" src="dist/images/fakers/profile-5.jpg" alt="Midone - Tailwind Admin Dashboard Template">
                    </div>
                    <div class="mt-3 text-center lg:ml-2 lg:mr-auto lg:mt-0 lg:text-left">
                        <a class="font-medium" href="">
                            John Travolta
                        </a>
                        <div class="mt-0.5 text-xs text-slate-500">
                            Frontend Engineer
                        </div>
                    </div>
                    <div class="mt-4 flex lg:mt-0">
                        <button data-tw-merge="" class="transition duration-200 border shadow-sm inline-flex items-center justify-center rounded-md font-medium cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed bg-primary border-primary text-white dark:border-primary mr-2 px-2 py-1">Message</button>
                        <button data-tw-merge="" class="transition duration-200 border shadow-sm inline-flex items-center justify-center rounded-md font-medium cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed border-secondary text-slate-500 dark:border-darkmode-100/40 dark:text-slate-300 [&:hover:not(:disabled)]:bg-secondary/20 [&:hover:not(:disabled)]:dark:bg-darkmode-100/10 px-2 py-1">Profile</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="intro-y col-span-12 md:col-span-6">
            <div class="box">
                <div class="flex flex-col items-center p-5 lg:flex-row">
                    <div class="image-fit h-24 w-24 lg:mr-1 lg:h-12 lg:w-12">
                        <img class="rounded-full" src="dist/images/fakers/profile-12.jpg" alt="Midone - Tailwind Admin Dashboard Template">
                    </div>
                    <div class="mt-3 text-center lg:ml-2 lg:mr-auto lg:mt-0 lg:text-left">
                        <a class="font-medium" href="">
                            Denzel Washington
                        </a>
                        <div class="mt-0.5 text-xs text-slate-500">
                            DevOps Engineer
                        </div>
                    </div>
                    <div class="mt-4 flex lg:mt-0">
                        <button data-tw-merge="" class="transition duration-200 border shadow-sm inline-flex items-center justify-center rounded-md font-medium cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed bg-primary border-primary text-white dark:border-primary mr-2 px-2 py-1">Message</button>
                        <button data-tw-merge="" class="transition duration-200 border shadow-sm inline-flex items-center justify-center rounded-md font-medium cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed border-secondary text-slate-500 dark:border-darkmode-100/40 dark:text-slate-300 [&:hover:not(:disabled)]:bg-secondary/20 [&:hover:not(:disabled)]:dark:bg-darkmode-100/10 px-2 py-1">Profile</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="intro-y col-span-12 md:col-span-6">
            <div class="box">
                <div class="flex flex-col items-center p-5 lg:flex-row">
                    <div class="image-fit h-24 w-24 lg:mr-1 lg:h-12 lg:w-12">
                        <img class="rounded-full" src="dist/images/fakers/profile-14.jpg" alt="Midone - Tailwind Admin Dashboard Template">
                    </div>
                    <div class="mt-3 text-center lg:ml-2 lg:mr-auto lg:mt-0 lg:text-left">
                        <a class="font-medium" href="">
                            Russell Crowe
                        </a>
                        <div class="mt-0.5 text-xs text-slate-500">
                            Frontend Engineer
                        </div>
                    </div>
                    <div class="mt-4 flex lg:mt-0">
                        <button data-tw-merge="" class="transition duration-200 border shadow-sm inline-flex items-center justify-center rounded-md font-medium cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed bg-primary border-primary text-white dark:border-primary mr-2 px-2 py-1">Message</button>
                        <button data-tw-merge="" class="transition duration-200 border shadow-sm inline-flex items-center justify-center rounded-md font-medium cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed border-secondary text-slate-500 dark:border-darkmode-100/40 dark:text-slate-300 [&:hover:not(:disabled)]:bg-secondary/20 [&:hover:not(:disabled)]:dark:bg-darkmode-100/10 px-2 py-1">Profile</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="intro-y col-span-12 md:col-span-6">
            <div class="box">
                <div class="flex flex-col items-center p-5 lg:flex-row">
                    <div class="image-fit h-24 w-24 lg:mr-1 lg:h-12 lg:w-12">
                        <img class="rounded-full" src="dist/images/fakers/profile-11.jpg" alt="Midone - Tailwind Admin Dashboard Template">
                    </div>
                    <div class="mt-3 text-center lg:ml-2 lg:mr-auto lg:mt-0 lg:text-left">
                        <a class="font-medium" href="">
                            Angelina Jolie
                        </a>
                        <div class="mt-0.5 text-xs text-slate-500">
                            Frontend Engineer
                        </div>
                    </div>
                    <div class="mt-4 flex lg:mt-0">
                        <button data-tw-merge="" class="transition duration-200 border shadow-sm inline-flex items-center justify-center rounded-md font-medium cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed bg-primary border-primary text-white dark:border-primary mr-2 px-2 py-1">Message</button>
                        <button data-tw-merge="" class="transition duration-200 border shadow-sm inline-flex items-center justify-center rounded-md font-medium cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed border-secondary text-slate-500 dark:border-darkmode-100/40 dark:text-slate-300 [&:hover:not(:disabled)]:bg-secondary/20 [&:hover:not(:disabled)]:dark:bg-darkmode-100/10 px-2 py-1">Profile</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="intro-y col-span-12 md:col-span-6">
            <div class="box">
                <div class="flex flex-col items-center p-5 lg:flex-row">
                    <div class="image-fit h-24 w-24 lg:mr-1 lg:h-12 lg:w-12">
                        <img class="rounded-full" src="dist/images/fakers/profile-13.jpg" alt="Midone - Tailwind Admin Dashboard Template">
                    </div>
                    <div class="mt-3 text-center lg:ml-2 lg:mr-auto lg:mt-0 lg:text-left">
                        <a class="font-medium" href="">
                            Kevin Spacey
                        </a>
                        <div class="mt-0.5 text-xs text-slate-500">
                            Frontend Engineer
                        </div>
                    </div>
                    <div class="mt-4 flex lg:mt-0">
                        <button data-tw-merge="" class="transition duration-200 border shadow-sm inline-flex items-center justify-center rounded-md font-medium cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed bg-primary border-primary text-white dark:border-primary mr-2 px-2 py-1">Message</button>
                        <button data-tw-merge="" class="transition duration-200 border shadow-sm inline-flex items-center justify-center rounded-md font-medium cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed border-secondary text-slate-500 dark:border-darkmode-100/40 dark:text-slate-300 [&:hover:not(:disabled)]:bg-secondary/20 [&:hover:not(:disabled)]:dark:bg-darkmode-100/10 px-2 py-1">Profile</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="intro-y col-span-12 md:col-span-6">
            <div class="box">
                <div class="flex flex-col items-center p-5 lg:flex-row">
                    <div class="image-fit h-24 w-24 lg:mr-1 lg:h-12 lg:w-12">
                        <img class="rounded-full" src="dist/images/fakers/profile-2.jpg" alt="Midone - Tailwind Admin Dashboard Template">
                    </div>
                    <div class="mt-3 text-center lg:ml-2 lg:mr-auto lg:mt-0 lg:text-left">
                        <a class="font-medium" href="">
                            Johnny Depp
                        </a>
                        <div class="mt-0.5 text-xs text-slate-500">
                            DevOps Engineer
                        </div>
                    </div>
                    <div class="mt-4 flex lg:mt-0">
                        <button data-tw-merge="" class="transition duration-200 border shadow-sm inline-flex items-center justify-center rounded-md font-medium cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed bg-primary border-primary text-white dark:border-primary mr-2 px-2 py-1">Message</button>
                        <button data-tw-merge="" class="transition duration-200 border shadow-sm inline-flex items-center justify-center rounded-md font-medium cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed border-secondary text-slate-500 dark:border-darkmode-100/40 dark:text-slate-300 [&:hover:not(:disabled)]:bg-secondary/20 [&:hover:not(:disabled)]:dark:bg-darkmode-100/10 px-2 py-1">Profile</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="intro-y col-span-12 md:col-span-6">
            <div class="box">
                <div class="flex flex-col items-center p-5 lg:flex-row">
                    <div class="image-fit h-24 w-24 lg:mr-1 lg:h-12 lg:w-12">
                        <img class="rounded-full" src="dist/images/fakers/profile-7.jpg" alt="Midone - Tailwind Admin Dashboard Template">
                    </div>
                    <div class="mt-3 text-center lg:ml-2 lg:mr-auto lg:mt-0 lg:text-left">
                        <a class="font-medium" href="">
                            Robert De Niro
                        </a>
                        <div class="mt-0.5 text-xs text-slate-500">
                            Frontend Engineer
                        </div>
                    </div>
                    <div class="mt-4 flex lg:mt-0">
                        <button data-tw-merge="" class="transition duration-200 border shadow-sm inline-flex items-center justify-center rounded-md font-medium cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed bg-primary border-primary text-white dark:border-primary mr-2 px-2 py-1">Message</button>
                        <button data-tw-merge="" class="transition duration-200 border shadow-sm inline-flex items-center justify-center rounded-md font-medium cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed border-secondary text-slate-500 dark:border-darkmode-100/40 dark:text-slate-300 [&:hover:not(:disabled)]:bg-secondary/20 [&:hover:not(:disabled)]:dark:bg-darkmode-100/10 px-2 py-1">Profile</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="intro-y col-span-12 md:col-span-6">
            <div class="box">
                <div class="flex flex-col items-center p-5 lg:flex-row">
                    <div class="image-fit h-24 w-24 lg:mr-1 lg:h-12 lg:w-12">
                        <img class="rounded-full" src="dist/images/fakers/profile-8.jpg" alt="Midone - Tailwind Admin Dashboard Template">
                    </div>
                    <div class="mt-3 text-center lg:ml-2 lg:mr-auto lg:mt-0 lg:text-left">
                        <a class="font-medium" href="">
                            Johnny Depp
                        </a>
                        <div class="mt-0.5 text-xs text-slate-500">
                            Frontend Engineer
                        </div>
                    </div>
                    <div class="mt-4 flex lg:mt-0">
                        <button data-tw-merge="" class="transition duration-200 border shadow-sm inline-flex items-center justify-center rounded-md font-medium cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed bg-primary border-primary text-white dark:border-primary mr-2 px-2 py-1">Message</button>
                        <button data-tw-merge="" class="transition duration-200 border shadow-sm inline-flex items-center justify-center rounded-md font-medium cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed border-secondary text-slate-500 dark:border-darkmode-100/40 dark:text-slate-300 [&:hover:not(:disabled)]:bg-secondary/20 [&:hover:not(:disabled)]:dark:bg-darkmode-100/10 px-2 py-1">Profile</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- BEGIN: Users Layout -->
        <!-- BEGIN: Pagination -->
        <div class="intro-y col-span-12 flex flex-wrap items-center sm:flex-row sm:flex-nowrap">
            <nav class="w-full sm:mr-auto sm:w-auto">
                <ul class="flex w-full mr-0 sm:mr-auto sm:w-auto">
                    <li class="flex-1 sm:flex-initial">
                        <a data-tw-merge="" class="transition duration-200 border items-center justify-center py-2 rounded-md cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed min-w-0 sm:min-w-[40px] shadow-none font-normal flex border-transparent text-slate-800 sm:mr-2 dark:text-slate-300 px-1 sm:px-3"><i data-tw-merge="" data-lucide="chevrons-left" class="stroke-1.5 h-4 w-4"></i></a>
                    </li>
                    <li class="flex-1 sm:flex-initial">
                        <a data-tw-merge="" class="transition duration-200 border items-center justify-center py-2 rounded-md cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed min-w-0 sm:min-w-[40px] shadow-none font-normal flex border-transparent text-slate-800 sm:mr-2 dark:text-slate-300 px-1 sm:px-3"><i data-tw-merge="" data-lucide="chevron-left" class="stroke-1.5 h-4 w-4"></i></a>
                    </li>
                    <li class="flex-1 sm:flex-initial">
                        <a data-tw-merge="" class="transition duration-200 border items-center justify-center py-2 rounded-md cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed min-w-0 sm:min-w-[40px] shadow-none font-normal flex border-transparent text-slate-800 sm:mr-2 dark:text-slate-300 px-1 sm:px-3">...</a>
                    </li>
                    <li class="flex-1 sm:flex-initial">
                        <a data-tw-merge="" class="transition duration-200 border items-center justify-center py-2 rounded-md cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed min-w-0 sm:min-w-[40px] shadow-none font-normal flex border-transparent text-slate-800 sm:mr-2 dark:text-slate-300 px-1 sm:px-3">1</a>
                    </li>
                    <li class="flex-1 sm:flex-initial">
                        <a data-tw-merge="" class="transition duration-200 border items-center justify-center py-2 rounded-md cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed min-w-0 sm:min-w-[40px] shadow-none font-normal flex border-transparent text-slate-800 sm:mr-2 dark:text-slate-300 px-1 sm:px-3 !box dark:bg-darkmode-400">2</a>
                    </li>
                    <li class="flex-1 sm:flex-initial">
                        <a data-tw-merge="" class="transition duration-200 border items-center justify-center py-2 rounded-md cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed min-w-0 sm:min-w-[40px] shadow-none font-normal flex border-transparent text-slate-800 sm:mr-2 dark:text-slate-300 px-1 sm:px-3">3</a>
                    </li>
                    <li class="flex-1 sm:flex-initial">
                        <a data-tw-merge="" class="transition duration-200 border items-center justify-center py-2 rounded-md cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed min-w-0 sm:min-w-[40px] shadow-none font-normal flex border-transparent text-slate-800 sm:mr-2 dark:text-slate-300 px-1 sm:px-3">...</a>
                    </li>
                    <li class="flex-1 sm:flex-initial">
                        <a data-tw-merge="" class="transition duration-200 border items-center justify-center py-2 rounded-md cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed min-w-0 sm:min-w-[40px] shadow-none font-normal flex border-transparent text-slate-800 sm:mr-2 dark:text-slate-300 px-1 sm:px-3"><i data-tw-merge="" data-lucide="chevron-right" class="stroke-1.5 h-4 w-4"></i></a>
                    </li>
                    <li class="flex-1 sm:flex-initial">
                        <a data-tw-merge="" class="transition duration-200 border items-center justify-center py-2 rounded-md cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed min-w-0 sm:min-w-[40px] shadow-none font-normal flex border-transparent text-slate-800 sm:mr-2 dark:text-slate-300 px-1 sm:px-3"><i data-tw-merge="" data-lucide="chevrons-right" class="stroke-1.5 h-4 w-4"></i></a>
                    </li>
                </ul>
            </nav>
            <select data-tw-merge="" class="disabled:bg-slate-100 disabled:cursor-not-allowed disabled:dark:bg-darkmode-800/50 [&[readonly]]:bg-slate-100 [&[readonly]]:cursor-not-allowed [&[readonly]]:dark:bg-darkmode-800/50 transition duration-200 ease-in-out text-sm border-slate-200 shadow-sm rounded-md py-2 px-3 pr-8 focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus:border-primary focus:border-opacity-40 dark:bg-darkmode-800 dark:border-transparent dark:focus:ring-slate-700 dark:focus:ring-opacity-50 group-[.form-inline]:flex-1 !box mt-3 w-20 sm:mt-0">
                <option>10</option>
                <option>25</option>
                <option>35</option>
                <option>50</option>
            </select>
        </div>
        <!-- END: Pagination -->
    </div>
@endsection
@section('addition_css')
@endsection
@section('addition_script')
@endsection