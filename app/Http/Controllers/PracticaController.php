<?php 

namespace App\Http\Controllers;
use App\Practica;
use Illuminate\Http\Request;
use App\Subpractica;

class PracticaController extends Controller 
{

  public function vistaPracticas()
  {
      return view('practicas');
  }
  
  public function get()
  {
      return Practica::all();
  }

  public function getDetalle($id)
  {
      return Practica::where('id',$id)->get();
  }
  
  public function add(Request $request)
  {   
      
      DB::transaction(function() use ($request)
      {
          
          $this->validate($request, [
               'descripcion'=>'required|min:4',
                'material'=>'required',
                'precio'=>'required',
                'subpractica'=>'required'
          ]);

          $practica = Practica::create([
          'descripcion'=>$request->descripcion,'observacion'=>$request->observacion, 'material'=>$request->material,'precio'=>$request->precio]);
      
          for($i=0;$i<count($request->subpractica);$i++)
          {
              Subpractica::create([
            'practica'=>$practica['id'], 'descripcion'=>$request->subpractica[$i]['descripcion'], 'unidad'=>$request->subpractica[$i]['unidad'],
            'valor_referencia'=>$request->subpractica[$i]['valor_referencia']
           ]);
          }
      });
      
  }
  
}

?>