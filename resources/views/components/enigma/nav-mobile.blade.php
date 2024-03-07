<!-- BEGIN: Mobile Menu -->
<div class="mobile-menu group top-0 inset-x-0 fixed bg-theme-1/90 z-[60] border-b border-white/[0.08] dark:bg-darkmode-800/90 md:hidden before:content-[''] before:w-full before:h-screen before:z-10 before:fixed before:inset-x-0 before:bg-black/90 before:transition-opacity before:duration-200 before:ease-in-out before:invisible before:opacity-0 [&.mobile-menu--active]:before:visible [&.mobile-menu--active]:before:opacity-100">
    <div class="flex h-[70px] items-center px-3 sm:px-8">
        <a class="mr-auto flex" href="">
            <img class="w-6" src="dist/images/logo.svg" alt="Midone - Tailwind Admin Dashboard Template">
        </a>
        <a class="mobile-menu-toggler" href="#">
            <i data-tw-merge="" data-lucide="bar-chart2" class="stroke-1.5 h-8 w-8 -rotate-90 transform text-white"></i>
        </a>
    </div>
    <div class="scrollable h-screen z-20 top-0 left-0 w-[270px] -ml-[100%] bg-primary transition-all duration-300 ease-in-out dark:bg-darkmode-800 [&[data-simplebar]]:fixed [&_.simplebar-scrollbar]:before:bg-black/50 group-[.mobile-menu--active]:ml-0">
        <a href="#" class="fixed top-0 right-0 mt-4 mr-4 transition-opacity duration-200 ease-in-out invisible opacity-0 group-[.mobile-menu--active]:visible group-[.mobile-menu--active]:opacity-100">
            <i data-tw-merge="" data-lucide="x-circle" class="stroke-1.5 mobile-menu-toggler h-8 w-8 -rotate-90 transform text-white"></i>
        </a>
        <ul class="py-2">
            <!-- BEGIN: First Child -->
            <li class="text-white text-center">AKTIVITAS</li>
            <li>
                <a class="menu" href="javascript:;">
                    <div class="menu__icon">
                        <i data-tw-merge="" data-lucide="home" class="stroke-1.5 w-5 h-5"></i>
                    </div>
                    <div class="menu__title">
                        Dashboard
                    </div>
                </a>
            </li>
            <li>
                <a class="menu menu--active" href="enigma-side-menu-file-manager-page.html">
                    <div class="menu__icon">
                        <i data-tw-merge="" data-lucide="hard-drive" class="stroke-1.5 w-5 h-5"></i>
                    </div>
                    <div class="menu__title">
                        Kelola Berkas
                    </div>
                </a>
            </li>
            <li>
                <a class="menu menu--active" href="enigma-side-menu-file-manager-page.html">
                    <div class="menu__icon">
                        <i data-tw-merge="" data-lucide="file-clock" class="stroke-1.5 w-5 h-5"></i>
                    </div>
                    <div class="menu__title">
                        Log
                    </div>
                </a>
            </li>
            <li class="menu__divider my-6"></li>
            <li class="text-white text-center">MASTER</li>
            <li>
                <a class="menu" href="javascript:;">
                    <div class="menu__icon">
                        <i data-tw-merge="" data-lucide="scan-face" class="stroke-1.5 w-5 h-5"></i>
                    </div>
                    <div class="menu__title">
                        Kelola Akses
                    </div>
                </a>
            </li>
            <li>
                <a class="menu" href="javascript:;">
                    <div class="menu__icon">
                        <i data-tw-merge="" data-lucide="component" class="stroke-1.5 w-5 h-5"></i>
                    </div>
                    <div class="menu__title">
                        SatKer
                    </div>
                </a>
            </li>
            <li>
                <a class="menu" href="javascript:;">
                    <div class="menu__icon">
                        <i data-tw-merge="" data-lucide="users" class="stroke-1.5 w-5 h-5"></i>
                    </div>
                    <div class="menu__title">
                        Pengguna
                    </div>
                </a>
            </li>
            <li>
                <a class="menu" href="javascript:;">
                    <div class="menu__icon">
                        <i data-tw-merge="" data-lucide="sidebar" class="stroke-1.5 w-5 h-5"></i>
                    </div>
                    <div class="menu__title">
                        Kelola Input
                    </div>
                </a>
            </li>
            <!-- END: First Child -->
        </ul>
    </div>
</div>
<!-- END: Mobile Menu -->