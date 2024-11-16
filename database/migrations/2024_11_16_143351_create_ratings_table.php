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
        Schema::create('ratings', function (Blueprint $table) {
            $table->id();
                        // علاقة بوليمورفية: 'ratingable_id' و 'ratingable_type' يحددان الكيان الذي يتم تقييمه

            $table->unsignedBigInteger('ratingable_id'); // ID الكائن الذي يتم تقييمه (رحلة أو مستخدم)
            $table->string('ratingable_type'); 
            // نوع الكائن الذي يتم تقييمه (مثلاً: App\Models\Trip أو App\Models\User) ***** سيخزن اسم الفئة (Class Name) 
            $table->integer('rating'); // 1-5 Stars or points
            $table->timestamps();

        });

    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('ratings');
    }
};
