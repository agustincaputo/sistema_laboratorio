<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Analisis extends Model 
{

    protected $table = 'analisis';
    public $timestamps = false;
    protected $fillable = array('protocolo', 'fecha', 'paciente', 'pago');

    public function detalleAnalisis()
    {
        return $this->hasOne('DetalleAnalisis', 'protocolo');
    }

    public function analisisPaciente()
    {
        return $this->belongsTo('Paciente', 'documento');
    }

}