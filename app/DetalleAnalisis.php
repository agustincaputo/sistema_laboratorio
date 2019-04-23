<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class DetalleAnalisis extends Model 
{

    protected $table = 'detalle_analisis';
    public $timestamps = false;
    protected $fillable = array('protocolo', 'practica', 'resultado');

    public function detalleAnalisis()
    {
        return $this->belongsTo('Analisis', 'protocolo');
    }

    public function detalleAnalisisPractica()
    {
        return $this->belongsTo('Practica', 'id');
    }

}