<?php

use App\Http\Controllers\Auth\RegisteredUserController;
use App\Http\Controllers\DynamicInputController;
use App\Http\Controllers\FileManagerController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\LogController;
use App\Http\Controllers\OptionController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\RoleController;
use App\Http\Controllers\UsergroupController;
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

// -------- API ----- NO/REQ LOGIN
Route::group(['prefix' => 'api'], function () {
    // Route::post('/survey/post-add', [StatisticController::class, 'post_add_survey']);
  
    Route::middleware('auth')->group(function () {
        Route::post('/file/get', [FileManagerController::class, 'get_list']);
        Route::post('/file/post-add', [FileManagerController::class, 'post_add']);
        Route::post('/file/post-edit', [FileManagerController::class, 'post_edit']);
        Route::post('/file/post-delete/{id}', [FileManagerController::class, 'post_delete']);

        Route::post('/option/get', [OptionController::class, 'get_list']);
        
        Route::post('/dynamic-input/get', [DynamicInputController::class, 'get_list']);
        Route::post('/dynamic-input/post-add', [DynamicInputController::class, 'post_add']);
        Route::post('/dynamic-input/post-edit', [DynamicInputController::class, 'post_edit']);
        Route::post('/dynamic-input/post-delete/{id}', [DynamicInputController::class, 'post_delete']);

        Route::post('/role/get', [RoleController::class, 'get_list']);
        Route::post('/role/post-add', [RoleController::class, 'post_add']);
        Route::post('/role/post-edit', [RoleController::class, 'post_edit']);
        Route::post('/role/post-delete/{id}', [RoleController::class, 'post_delete']);

        Route::post('/user-group/get', [UserGroupController::class, 'get_list']);
        Route::post('/user-group/post-add', [UserGroupController::class, 'post_add']);
        Route::post('/user-group/post-edit', [UserGroupController::class, 'post_edit']);
        Route::post('/user-group/post-delete/{id}', [UserGroupController::class, 'post_delete']);

        Route::post('/user/get', [RegisteredUserController::class, 'get_list']);
        Route::post('/user/post-add', [RegisteredUserController::class, 'post_add']);
        Route::post('/user/post-edit', [RegisteredUserController::class, 'post_edit']);
        Route::post('/user/post-delete/{id}', [RegisteredUserController::class, 'post_delete']);
    });
});

// -------- PAGE ---- NO LOGIN
Route::get('/', function () {
    return view('welcome');
});
Route::get('shared/{id}', [FileManagerController::class, 'page_shared'])->name('file-manager.shared');

// -------- PAGE ---- REQ LOGIN
Route::middleware(['auth', 'verified'])->group(function () {
    Route::get('/', function () {
        return view('pages.dashboard');
    });
    Route::get('/dashboard', function () {
        return view('pages.dashboard');
    })->name('dashboard');
    
    Route::get('files', [FileManagerController::class, 'index'])->name('file-manager');
    Route::get('file/add', [FileManagerController::class, 'form_add'])->name('file-manager.add');
    Route::get('file/edit/{id}', [FileManagerController::class, 'form_edit'])->name('file-manager.edit');

    Route::get('logs', [LogController::class, 'index'])->name('log');
    Route::get('log/detail/{id}', [LogController::class, 'form_edit'])->name('log.edit');
    
    Route::get('roles', [RoleController::class, 'index'])->name('role');
    Route::get('role/add', [RoleController::class, 'form_add'])->name('role.add');
    Route::get('role/edit/{id}', [RoleController::class, 'form_edit'])->name('role.edit');

    Route::get('user-groups', [UserGroupController::class, 'index'])->name('user-group');
    Route::get('user-group/add', [UserGroupController::class, 'form_add'])->name('user-group.add');
    Route::get('user-group/edit/{id}', [UserGroupController::class, 'form_edit'])->name('user-group.edit');

    Route::get('users', [RegisteredUserController::class, 'index'])->name('user');
    Route::get('user/edit', [RegisteredUserController::class, 'form_edit'])->name('user.edit');

    Route::get('dynamic-inputs', [DynamicInputController::class, 'index'])->name('dynamic-input');
    Route::get('dynamic-input/add/{type}', [DynamicInputController::class, 'form_add'])->name('dynamic-input.add');
    Route::get('dynamic-input/edit/{id}', [DynamicInputController::class, 'form_edit'])->name('dynamic-input.edit');

    Route::get('faq', [HomeController::class, 'index_faq'])->name('faq');
});

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';
