<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Car extends Model
{
    use HasFactory;
    protected $table = 'Cars';

    protected $fillable = [
        'name',
        'image'
    ];

    public function trip()
    {
        return $this->hasOne(Trip::class);
    }
    
}
