<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class TipoDocumento extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
	{
		Schema::create('tipo_documento', function(Blueprint $table) {
			$table->increments('id');
			$table->string('tipo',10);
		});
	}

	public function down()
	{
		Schema::drop('tipo_documento');
	}
}
