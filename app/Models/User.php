<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
// use Laravel\Passport\HasApiTokens;
// use trait Laravel\Passport\HasApiTokens;
use Laravel\Passport\HasApiTokens;

use Illuminate\Database\Eloquent\Model;


class User extends Authenticatable
{
    use HasFactory, Notifiable;
    use HasApiTokens;

    protected $fillable = [
        'username',
        'gender',
        'mobile_number',
        'session',
        'otp',
        'expire_at',
        'fullname',
        'user_session',
    ];

    protected $hidden = [
        'password',
        'remember_token',
    ];

    protected $casts = [
        'email_verified_at' => 'datetime',
        'password' => 'hashed',
    ];
    public function role()
    {
        return $this->hasOne(role::class);
    }
    public function TripUser()
    {
        return $this->hasOne(Trip::class);
    }

    public function trip_passenger()
    {
        return $this->hasOne(TripPassenger::class);
    }

    // علاقة Many-to-Many بين المستخدم والرحلات عبر جدول وسيط 'trip_user'
    public function trips()
    {
        return $this->belongsToMany(Trip::class, 'trip_user')
                    ->withPivot('status'); // إضافة عمود الحالة في الجدول الوسيط
    }

    // علاقة مع الركاب في الرحلات عبر جدول 'trip_passengers'
    public function tripPassengers()
    {
        return $this->hasMany(TripPassenger::class);
    }

    public function ratings()
    {
        return $this->morphMany(Rating::class, 'ratingable');
    }
    
}
