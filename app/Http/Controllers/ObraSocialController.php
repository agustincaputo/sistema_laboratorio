<?php 

namespace App\Http\Controllers;
use App\ObraSocial;
use Illuminate\Http\Request;

class ObraSocialController extends Controller 
{
    public function get()
    {
        return ObraSocial::all();
    }  
}

?>