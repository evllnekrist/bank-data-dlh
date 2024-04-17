<?php

namespace App\Models;

// use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
// use App\Models\File;

class DynamicInput extends Model
{
    // use HasFactory;
    use SoftDeletes;
    protected $table = 'dynamic_inputs';
    protected $fillable = [
        'name',
        'description',
        'is_enabled',
        'is_required',
        'is_multiple',
        'type_of_file',
        'type_of_input',
        'default_value',
        'label',
        'behavior', // akan digunakan untuk menambatkan sifat-sifat seperti, tidak boleh ada spasi atau harus ada numerik (diatur lewat class). Atau untuk input file, menentukan attribute ACCEPT img atau doc (diatur lewat config)
        'option_reference', // dipakai sebagai TYPE dari table OPTIONS. Jadi untuk menambahkan opsi, tambahkan di table OPSI dengan TYPE sesuai yang didaftarkan di kolom ini
        'created_at',
        'created_by',
        'updated_at',
        'updated_by',
    ];
}
