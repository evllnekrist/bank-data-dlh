<?php

namespace App\Models;

// use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
// use Illuminate\Database\Eloquent\SoftDeletes;

class Keyword extends Model
{
    // use HasFactory;
    // use SoftDeletes;
    protected $table = 'keywords';
    protected $fillable = [
      'subject',
      'number_of_uses', // jumlah penggunaan
      'created_at',
      'created_by',
      'updated_at',
      'updated_by',
    ];

}
