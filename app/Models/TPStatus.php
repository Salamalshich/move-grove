<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TPStatus extends Model
{
    protected $table = 't_p_statuses';

    use HasFactory;

    // protected $fillable = [
    //     'name',
    //     'code',
    // ];
    public function tripPassengers()
    {
        return $this->hasOne(TripPassenger::class, 'trip_passenger');
    }

    public function trip_passenger()
    {
        return $this->hasOne(TripPassenger::class);
    }
}
