<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class City extends Model
{
    use HasFactory;
    protected $table = 'Cities';

    protected $fillable = [
        'name',
    ];

    public function sourceTrips()
    {
        return $this->hasOne(TripPassenger::class, 'source_id');
    }

    public function destinationTrips()
    {
        return $this->hasOne(TripPassenger::class, 'destination_id');
    }
    
}
