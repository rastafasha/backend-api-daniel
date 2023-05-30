<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePaymentMethodsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('payment_methods', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->boolean('modoPaypal')->nullable();
            $table->string('clienteIdPaypal')->nullable();
            $table->string('llaveSecretaPaypal')->nullable();
            $table->boolean('modoBinance')->nullable();
            $table->string('merchantIdBinance')->nullable();
            $table->string('accountIdBinance')->nullable();
            $table->string('apiKeyBinance')->nullable();
            $table->foreignId('currency_id')->references('id')->on('currencies')->onDelete('cascade');
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('payment_methods');
    }
}
