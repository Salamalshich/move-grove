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
        Schema::create('trip_passenger', function (Blueprint $table) {
            $table->id();
            $table->foreignId('trip_id')->constrained('trips')->onDelete('cascade'); // مفتاح أجنبي إلى جدول الرحلات
            $table->foreignId('user_id')->constrained('users')->onDelete('cascade'); // مفتاح أجنبي إلى جدول المستخدمين
            $table->string('status')->default('pending'); // حالة الطلب (معلق، مقبول، إلخ)
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('trip_passenger');

    }
};
