<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateSubpracticaTable extends Migration {

	public function up()
	{
		Schema::create('subpractica', function(Blueprint $table) {
			$table->increments('id');
			$table->integer('practica');
			$table->string('descripcion', 200);
			$table->string('unidad', 100);
			$table->text('valor_referencia');
		});
	}

	public function down()
	{
		Schema::drop('subpractica');
	}
}