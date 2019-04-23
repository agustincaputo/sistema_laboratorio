<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ObraSocial extends Model 
{

    protected $table = 'obra_social';
    public $timestamps = false;
    protected $fillable = array('id', 'descripcion');

    public function afiliacionObraSocial()
    {
        return $this->hasOne('Afiliacion', 'obra_social');
    }

}