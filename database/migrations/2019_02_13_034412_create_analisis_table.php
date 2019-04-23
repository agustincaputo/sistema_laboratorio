<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateAnalisisTable extends Migration {

	public function up()
	{
		Schema::create('analisis', function(Blueprint $table) {
			$table->increments('protocolo');
			$table->datetime('fecha');
			$table->integer('paciente');
			$table->float('pago');
		});
	}

	public function down()
	{
		Schema::drop('analisis');
	}
}