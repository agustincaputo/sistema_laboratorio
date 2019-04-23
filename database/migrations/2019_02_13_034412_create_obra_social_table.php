<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateObraSocialTable extends Migration {

	public function up()
	{
		Schema::create('obra_social', function(Blueprint $table) {
			$table->increments('id');
			$table->string('descripcion', 200);
		});
	}

	public function down()
	{
		Schema::drop('obra_social');
	}
}