
<!-- BEGIN: Side Menu -->
<nav class="side-nav z-50 -mt-4 hidden w-[100px] overflow-x-hidden px-5 pb-16 pt-32 md:block xl:w-[260px]">
    <ul>
        AKTIVITAS
        <li>
            <a href="{{ route('dashboard') }}" class="side-menu">
                <div class="side-menu__icon">
                    <i data-tw-merge="" data-lucide="home" class="stroke-1.5 w-5 h-5"></i>
                </div>
                <div class="side-menu__title">
                    Dashboard
                </div>
            </a>
        </li>
        <li>
            <a href="{{ route('file-manager') }}" class="side-menu side-menu--active">
                <div class="side-menu__icon">
                    <i data-tw-merge="" data-lucide="hard-drive" class="stroke-1.5 w-5 h-5"></i>
                </div>
                <div class="side-menu__title">
                    Kelola Berkas
                </div>
            </a>
        </li>
        <li>
            <a href="{{ route('log') }}" class="side-menu side-menu">
                <div class="side-menu__icon">
                    <i data-tw-merge="" data-lucide="file-clock" class="stroke-1.5 w-5 h-5"></i>
                </div>
                <div class="side-menu__title">
                    Log
                </div>
            </a>
        </li>
        <li class="side-nav__divider my-6"></li>
        MASTER
        <li>
            <a href="{{ route('role') }}" class="side-menu">
                <div class="side-menu__icon">
                    <i data-tw-merge="" data-lucide="scan-face" class="stroke-1.5 w-5 h-5"></i>
                </div>
                <div class="side-menu__title">
                    Kelola Akses 
                </div>
            </a>
        </li>
        <li>
            <a href="{{ route('user-group') }}" class="side-menu">
                <div class="side-menu__icon">
                    <i data-tw-merge="" data-lucide="component" class="stroke-1.5 w-5 h-5"></i>
                </div>
                <div class="side-menu__title">
                    SatKer
                </div>
            </a>
        </li>
        <li>
            <a href="{{ route('user') }}" class="side-menu">
                <div class="side-menu__icon">
                    <i data-tw-merge="" data-lucide="users" class="stroke-1.5 w-5 h-5"></i>
                </div>
                <div class="side-menu__title">
                    Pengguna
                </div>
            </a>
        </li>
        <li>
            <a href="{{ route('dynamic-form') }}" class="side-menu">
                <div class="side-menu__icon">
                    <i data-tw-merge="" data-lucide="sidebar" class="stroke-1.5 w-5 h-5"></i>
                </div>
                <div class="side-menu__title">
                    Kelola Input
                </div>
            </a>
        </li>
    </ul>
</nav>
<!-- END: Side Menu -->