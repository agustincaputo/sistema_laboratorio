<?php

Route::get('/', function () {
    return view('inicio');
});

//Rutas de pacientes
Route::group(['prefix'=>'pacientes'],function()
{
    Route::get('/',['uses'=>'PacienteController@get','as'=>'getPacientes']);
    Route::get('/buscar/{id}',['uses'=>'PacienteController@getPaciente', 'as'=>'getPaciente']);
    Route::get('/tipo_documento',['uses'=>'PacienteController@getTiposDocumento','as'=>'getTiposDocumento']);
    Route::post('/',['uses'=>'PacienteController@add','as'=>'nuevoPaciente']);
    Route::put('/',['uses'=>'PacienteController@update','as'=>'updatePaciente']);
    Route::delete('/',['uses'=>'PacienteController@delete','as'=>'deletePaciente']);
});

//Rutas de practicas

Route::group(['prefix'=>'practica'],function()
{   
   Route::get('/',['uses'=>'PracticaController@get','as'=>'getPractica']);
   Route::get('/{id}',['uses'=>'PracticaController@getDetalle','as'=>'getDetallePractica']);
   Route::post('/',['uses'=>'PracticaController@add','as'=>'addPractica']);
   Route::delete('/',['uses'=>'PracticaController@delete','as'=>'deletePractica']);
   Route::put('/',['uses'=>'PracticaController@edit','as'=>'editPractica']); 
});

//Rutas de obras sociales

Route::group(['prefix'=>'obrasocial'],function()
{
    Route::get('/',['uses'=>'ObraSocialController@get','as'=>'getObrasocial']);
    Route::get('/{id}',['uses'=>'ObraSocialController@getDetalle','as'=>'getDetalleObrasocial']);
    Route::post('/',['uses'=>'ObraSocialController@add','as'=>'addObrasocial']);
    Route::put('/',['uses'=>'ObraSocialController@edit','as'=>'editObrasocial']);
    Route::delete('/',['uses'=>'ObraSocialController@delete','as'=>'deleteObrasocial']);
});

//Rutas de vistas

Route::get('/registropacientes',['uses'=>'PacienteController@vistaPacientes','as'=>'vistaPacientes']);
Route::get('/registropracticas',['uses'=>'PracticaController@vistaPracticas','as'=>'vistaPracticas']);
Route::get('/registroobrasociales',['uses'=>'ObraSocialController@vistaObraSocial','as'=>'vistaObraSocial']);

