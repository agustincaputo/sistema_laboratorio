<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Practica extends Model 
{

    protected $table = 'practica';
    public $timestamps = false;
    protected $fillable = array('id', 'descripcion', 'observacion', 'material', 'precio');

    public function detalleAnalisisPractica()
    {
        return $this->hasOne('DetalleAnalisis', 'practica');
    }

    public function subpractica()
    {
        return $this->hasOne('Subpractica', 'practica');
    }

}