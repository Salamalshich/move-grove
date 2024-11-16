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

                Schema::create('users', function (Blueprint $table) {
                    $table->id();
                    $table->string('last_name');
                    $table->string('username')->unique();
                    $table->string('gender');
                    $table->dateTime('expire_at')->nullable();
                    $table->string('mobile_number')->unique();
                    $table->string('user_session')->nullable();
                    $table->rememberToken();
                    $table->timestamps();
                    
                    $table->foreignId('role_id')->constrained('roles')->onDelete('cascade');
        
                });
            }
        
        

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('users');

    }
};