<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreatePacienteTable extends Migration {

	public function up()
	{
		Schema::create('paciente', function(Blueprint $table) {
			$table->integer('documento')->primary();
			$table->string('tipo_documento',10);
                        $table->string('nombre_apellido',100);
			$table->date('fecha_nacimiento');
			$table->string('celular', 20);
			$table->string('telefono', 20);
			$table->string('direccion', 100);
			$table->string('localidad', 100);
			$table->timestamps();
		});
	}

	public function down()
	{
		Schema::drop('paciente');
	}
}