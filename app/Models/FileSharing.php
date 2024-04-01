<?php

namespace App\Models;

// use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Models\File;

class FileSharing extends Model
{
    // use HasFactory;
    use SoftDeletes;
    protected $table = 'file_sharings';
    protected $fillable = [
        // CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
        // 'id', // id uuid PRIMARY KEY DEFAULT uuid_generate_v4()
        'file_id',
        'type_of_sharing',
        'expired_at',
        'created_at',
        'created_by',
        'updated_at',
        'updated_by',
    ];
}
