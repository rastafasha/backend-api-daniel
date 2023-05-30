<?php

use App\Models\Profile;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProfileTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('profiles', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->references('id')->on('users')->onDelete('cascade');
            $table->string('nombre');
            $table->string('surname')->nullable();
            $table->string('direccion')->nullable();
            $table->string('pais')->nullable();
            $table->string('estado')->nullable();
            $table->string('ciudad')->nullable();
            $table->string('telhome')->nullable();
            $table->string('telmovil')->nullable();
            $table->string('facebook')->nullable();
            $table->string('instagram')->nullable();
            $table->string('twitter')->nullable();
            $table->string('linkedin')->nullable();
            $table->string('shortdescription')->nullable();
            $table->string('emailPaypal')->nullable();
            $table->string('nombrePaypal')->nullable();
            $table->string('emailBinance')->nullable();
            $table->string('userIdBinance')->nullable();
            $table->string('image')->nullable();
            $table->enum('status', [Profile::VERIFIED, Profile::PENDING, Profile::REJECTED])->default(Profile::PENDING);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('profile');
    }
}
