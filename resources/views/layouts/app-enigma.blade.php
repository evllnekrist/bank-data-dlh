<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <meta name="description" content="Bank Data for Katingan Kab: Easy to Find, Available and Authorized">
        <meta name="keywords" content="katingan,bank data,bkad">
        <meta name="author" content="Evelline Krist.">
        <title>@yield('title') | Bank Data Kab.Katingan</title>
        <link rel="icon" type="image/x-icon" href="{{asset('img/logo.png')}}">
        <!-- BEGIN: CSS Assets-->
        <link rel="stylesheet" href="dist/css/vendors/simplebar.css">
        <link rel="stylesheet" href="dist/css/components/mobile-menu.css">
        <link rel="stylesheet" href="dist/css/vendors/tippy.css">
        <link rel="stylesheet" href="dist/css/themes/enigma/side-nav.css">
        <link rel="stylesheet" href="dist/css/app.css"> 
        <!-- END: CSS Assets-->
    </head>
    <body>
        @include('components.enigma.display-change-widget')
        <div class="enigma py-5 px-5 md:py-0 sm:px-8 md:px-0 before:content-[''] before:bg-gradient-to-b before:from-theme-1 before:to-theme-2 dark:before:from-darkmode-800 dark:before:to-darkmode-800 md:before:bg-none md:bg-slate-200 md:dark:bg-darkmode-800 before:fixed before:inset-0 before:z-[-1]">
            @include('components.enigma.nav-mobile')
            @include('components.enigma.top-bar')
            <div class="flex overflow-hidden">
                @include('components.enigma.nav-side')
                <!-- BEGIN: Content -->
                <div class="max-w-full md:max-w-none rounded-[30px] md:rounded-none px-4 md:px-[22px] min-w-0 min-h-screen bg-slate-100 flex-1 md:pt-20 pb-10 mt-5 md:mt-1 relative dark:bg-darkmode-700 before:content-[''] before:w-full before:h-px before:block">
                    @yield('content')
                </div>
                <!-- END: Content -->
            </div>
        </div>
        <!-- BEGIN: Vendor JS Assets-->
        <script src="dist/js/vendors/dom.js"></script>
        <script src="dist/js/vendors/tailwind-merge.js"></script>
        <script src="dist/js/vendors/lucide.js"></script>
        <script src="dist/js/vendors/popper.js"></script>
        <script src="dist/js/vendors/dropdown.js"></script>
        <script src="dist/js/vendors/tippy.js"></script>
        <script src="dist/js/vendors/transition.js"></script>
        <script src="dist/js/vendors/simplebar.js"></script>
        <script src="dist/js/vendors/modal.js"></script>
        <script src="dist/js/components/base/theme-color.js"></script>
        <script src="dist/js/components/base/lucide.js"></script>
        <script src="dist/js/themes/enigma.js"></script>
        <script src="dist/js/components/mobile-menu.js"></script>
        <script src="dist/js/components/themes/enigma/top-bar.js"></script> <!-- END: Vendor JS Assets-->
        <!-- BEGIN: Pages, layouts, components JS Assets-->
        <!-- END: Pages, layouts, components JS Assets-->
    </body>
</html>
