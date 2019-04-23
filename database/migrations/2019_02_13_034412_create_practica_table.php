<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreatePracticaTable extends Migration {

	public function up()
	{
		Schema::create('practica', function(Blueprint $table) {
			$table->increments('id');
			$table->string('descripcion', 200);
			$table->string('observacion', 1000);
			$table->integer('precio');
			$table->timestamps();
		});
	}

	public function down()
	{
		Schema::drop('practica');
	}
}