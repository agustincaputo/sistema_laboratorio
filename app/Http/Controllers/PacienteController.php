<?php 

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Afiliacion;
use App\Paciente;
use App\TipoDocumento;
use Illuminate\Support\Facades\DB;
class PacienteController extends Controller 
{

    public function vistaPacientes()
    {
        return view('pacientes');
    }
    
    public function get()
    {
        return Paciente::leftJoin('afiliacion','paciente.id','=','afiliacion.paciente')
       ->join('tipo_documento','tipo_documento.id','=','paciente.tipo_documento')
       ->select('paciente.id','paciente.documento','paciente.tipo_documento','paciente.nombre_y_apellido',
               'paciente.fecha_nacimiento','paciente.celular','paciente.telefono','paciente.direccion',
               'paciente.localidad','afiliacion.nro_afiliado','afiliacion.obra_social','tipo_documento.tipo_documento as paciente_tipo_documento')->get();
    }
    
    public function getPaciente($id)
    {
        return Paciente::leftJoin('afiliacion','paciente.id','=','afiliacion.paciente')
       ->join('tipo_documento','tipo_documento.id','=','paciente.tipo_documento')
        ->where([['paciente.id',$id]])
        ->select('paciente.id','paciente.documento','paciente.tipo_documento','paciente.nombre_y_apellido',
               'paciente.fecha_nacimiento','paciente.celular','paciente.telefono','paciente.direccion',
               'paciente.localidad','afiliacion.nro_afiliado','afiliacion.obra_social','tipo_documento.tipo_documento as paciente_tipo_documento')->get();
    }

        public function add(Request $request)
    {
        $validator = $this->validate($request,[
           'documento'=>'required|max:8|min:7',           
           'tipo_documento'=>'required',
           'nombre_y_apellido'=>'required|max:100|min:4',
           'fecha_nacimiento'=>'required|date',
           'direccion'=>'required|max:100',
           'localidad'=>'required|max:100',
        ]);
        
        DB::transaction(function($request) use ($request)
        {
            $id = Paciente::insertGetId(['tipo_documento'=>$request->tipo_documento,'documento'=>$request->documento,
                'nombre_y_apellido'=>$request->nombre_y_apellido,'fecha_nacimiento'=>$request->fecha_nacimiento,'celular'=>$request->celular,
                'telefono'=>$request->telefono,'direccion'=>$request->direccion,'localidad'=>$request->localidad]);
            if($request->obra_social!=null && $request->obra_social!=-1)
            {
                $validator_afiliacion = $this->validate($request,[
                    'nro_afiliado'=>'required'
                ]);
                Afiliacion::create(['nro_afiliado'=>$request->nro_afiliado,
                    'paciente'=>$id,'obra_social'=>$request->obra_social]);
            }
        });
        
        
    }
    
    public function update(Request $request)
    {
        $validator = $this->validate($request,[
           'nombre_y_apellido'=>'required|max:100|min:4',
           'fecha_nacimiento'=>'required|date',
           'direccion'=>'required|max:100',
           'localidad'=>'required|max:100'
        ]);
        
        Paciente::where('id',$request->id)
                ->update(['tipo_documento'=>$request->tipo_documento,'documento'=>$request->documento,'telefono'=>$request->telefono,'direccion'=>$request->direccion,'localidad'=>$request->localidad]);
        $data = Afiliacion::where('paciente',$request->id)
                ->update(['nro_afiliado'=>$request->nro_afiliado,'obra_social'=>$request->obra_social]);
        if($data == 0)
            Afiliacion:create(['nro_afiliado'=>$request->nro_afiliado,'paciente'=>$request->id,'obra_social'=>$request->obra_social]);
        
    }
    
    public function delete(Request $request)
    {
      DB::transaction(function() use ($request)
      {
        Paciente::where('id',$request->id)->delete();
        Afiliacion::where('paciente',$request->id)->delete();
      });
      

    }

    public function getTiposDocumento()
    {
        return TipoDocumento::all();
    }
  
}
