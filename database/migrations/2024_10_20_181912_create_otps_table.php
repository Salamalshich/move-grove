<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('OTPs', function (Blueprint $table) {
            $table->id();  // Primary key
            $table->string('otp', 4); 
            $table->string('mobile_number')->unique();

            $table->boolean('is_used')->default(false);  // Track whether the OTP has been used
        //    $table->timestamp(column: 'expires_at'); // وقت انتهاء صلاحية OT
            $table->timestamps();  

        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('OTPs');
    }
};
