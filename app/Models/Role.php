<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    use HasFactory;
    protected $table = 'role';
    protected $fillable = [
        'user_id',
        'role_id',
        'start_date',
        'end_date',
    ];
    public function User()
    {
        return $this->hasOne(user::class);
    }
}
