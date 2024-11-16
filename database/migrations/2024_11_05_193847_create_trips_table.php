<?php

use App\Models\Car;
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
        Schema::create('trips', function (Blueprint $table) {
            $table->id();
            $table->integer('total_seats');
            $table->decimal('price', 8, 2);
            $table->dateTime('dateTime');
            $table->string('notes');
            $table->string('plate_number')->unique();

            $table->timestamps();

            $table->unsignedBigInteger('driver_id')->nullable()->default(null); // تعديل العمود ليقبل القيمة NULL افتراضيًا

            $table->foreign('driver_id')->references('id')->on('users')
                ->onDelete('cascade');

                
            $table->foreignId('car_id')->constrained('cars')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('trips');

    }
};
