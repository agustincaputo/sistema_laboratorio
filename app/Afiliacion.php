<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Afiliacion extends Model 
{

    protected $table = 'afiliacion';
    public $timestamps = false;
    protected $fillable = array('nro_afiliado','paciente','obra_social');

    public function afiliacionObraSocial()
    {
        return $this->belongsTo('ObraSocial', 'id');
    }

    public function afiliacionPaciente()
    {
        return $this->belongsTo('Paciente', 'id');
    }

}