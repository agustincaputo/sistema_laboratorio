<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Subpractica extends Model 
{

    protected $table = 'subpractica';
    public $timestamps = false;
    protected $fillable = array('id', 'practica', 'descripcion', 'unidad', 'valor_referencia');

    public function subpractica()
    {
        return $this->belongsTo('Practica', 'id');
    }

}