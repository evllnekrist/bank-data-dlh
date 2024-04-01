<?php

namespace App\Models;

// use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class File extends Model
{
    // use HasFactory;
    use SoftDeletes;
    protected $table = 'files';
    protected $fillable = [
        'title',
        'user_group_id',
        'type_of_file',
        'type_of_publicity',
        'editorial_permission',
        'keywords',
        'file_main',
        'file_link',
        'dynamic_inputs',
        'created_at',
        'created_by',
        'updated_at',
        'updated_by',
    ];
}
