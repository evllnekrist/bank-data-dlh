<?php

namespace App\Models;

// use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Models\User;

class UserGroup extends Model
{
    // use HasFactory;
    use SoftDeletes;
    protected $table = 'user_groups';
    protected $fillable = [
        'nickname',
        'fullname',
        'email',
        'phone',
        'img_main',
        'is_enabled',
        'created_at',
        'created_by',
        'updated_at',
        'updated_by',
    ];

    public function user_list(){
      return $this->hasMany(User::class, 'id', 'user_group_id');
    }
}
