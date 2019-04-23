<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateDetalleAnalisisTable extends Migration {

	public function up()
	{
		Schema::create('detalle_analisis', function(Blueprint $table) {
			$table->integer('protocolo');
			$table->integer('practica');
			$table->string('resultado', 200);
		});
	}

	public function down()
	{
		Schema::drop('detalle_analisis');
	}
}