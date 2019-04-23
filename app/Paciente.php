<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Paciente extends Model 
{

    protected $table = 'paciente';
    public $timestamps = false;
    protected $fillable = array('id', 'documento', 'tipo_documento', 'nombre_y_apellido','fecha_nacimiento', 'celular', 'telefono', 'direccion', 'localidad');

    public function analisisPaciente()
    {
        return $this->hasOne('Analisis', 'paciente');
    }

    public function afiliacionPaciente()
    {
        return $this->hasOne('Afiliacion', 'paciente');
    }

}