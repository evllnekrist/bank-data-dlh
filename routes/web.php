<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('shared/{id}', [FileManagerController::class, 'page_shared'])->name('page.file-manager.shared');

Route::middleware(['auth', 'verified'])->group(function () {
    Route::get('/', function () {
        return view('pages.dashboard');
    });
    Route::get('/dashboard', function () {
        return view('pages.dashboard');
    })->name('dashboard');
    
    Route::get('files', [FileManagerController::class, 'index'])->name('page.file-manager');
    Route::get('file/add', [FileManagerController::class, 'form_add'])->name('page.file-manager.add');
    Route::get('file/edit/{id}', [FileManagerController::class, 'form_edit'])->name('page.file-manager.edit');

    Route::get('logs', [LogController::class, 'index'])->name('page.file-manager');
    Route::get('log/detail/{id}', [LogController::class, 'form_edit'])->name('page.file-manager.edit');
    
    Route::get('roles', [RoleController::class, 'index'])->name('page.role');
    Route::get('role/add', [RoleController::class, 'form_add'])->name('page.role.add');
    Route::get('role/edit/{id}', [RoleController::class, 'form_edit'])->name('page.role.edit');

    Route::get('user-groups', [UserGroupController::class, 'index'])->name('page.user-group');
    Route::get('user-group/add', [UserGroupController::class, 'form_add'])->name('page.user-group.add');
    Route::get('user-group/edit/{id}', [UserGroupController::class, 'form_edit'])->name('page.user-group.edit');

    Route::get('dynamic-forms', [DynamicFormController::class, 'index'])->name('page.dynamic-form');
    Route::get('dynamic-form/add', [DynamicFormController::class, 'form_add'])->name('page.dynamic-form.add');
    Route::get('dynamic-form/edit/{id}', [DynamicFormController::class, 'form_edit'])->name('page.dynamic-form.edit');
});

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';
