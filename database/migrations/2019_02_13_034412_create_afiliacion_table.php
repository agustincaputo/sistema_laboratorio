<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateAfiliacionTable extends Migration {

	public function up()
	{
		Schema::create('afiliacion', function(Blueprint $table) {
			$table->string('nro_afiliado', 50)->primary();
			$table->integer('paciente');
			$table->integer('obra_social');
		});
	}

	public function down()
	{
		Schema::drop('afiliacion');
	}
}