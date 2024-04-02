<?php

namespace App\Models;

// use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Models\User;
use App\Models\UserGroup;

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
        'type_of_extension',
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
    
    public function creator(){
        return $this->belongsTo(User::class, 'created_by', 'id');
    }

    public function owner_user_group(){
        return $this->belongsTo(UserGroup::class, 'user_group_id', 'id');
    }
}
