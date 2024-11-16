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
        Schema::create('trip_statuses', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->string('name');
            // $table->string('code')->unique();
            $table->string('code')->default('DEFAULT_CODE')->unique();
            $table->unsignedBigInteger('trip_id')->nullable()->default(null); // تعديل العمود ليقبل القيمة NULL افتراضيًا
            $table->foreign('trip_id')->references('id')->on('trips')->onDelete('cascade');
                
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('trip_statuses');
    }
};
