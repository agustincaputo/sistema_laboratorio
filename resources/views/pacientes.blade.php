@extends('base.base')

@section('content')

<div style="text-align: center" class="h1">Sección de pacientes</div>
<div id="app">
    <v-app id="inspire">
        <v-card>
            <v-card-title>
                <button class="btn btn-primary" v-on:click="nuevoPaciente()">Nuevo Paciente</button>
                <v-spacer></v-spacer>        
                <v-text-field v-model="search" append-icon="search" label="Buscar" single-line hide-details></v-text-field>
            </v-card-title>
            <v-data-table :headers="headers" :items="pacientes" :search="search">
                <template slot="items" slot-scope="props">
                    <td>@{{ props.item.id }}</td>
                    <td>@{{ props.item.paciente_tipo_documento }} - @{{ props.item.documento }}</td>
                    <td>@{{ props.item.nombre_y_apellido }}</td>
                    <td><button class="btn btn-elegant btn-" v-on:click="modificarPaciente(props.item)">Abrir</button></td>
                    <td><a v-on:click="eliminarPaciente(props.item.id)"><i class="fa fa-times fa-2x" style="color: red"></i></a></td>
                </template>
                <v-alert slot="no-results" :value="true" color="error" icon="warning">
                    El campo de busqueda "@{{ search }}" no encontró resultados.
                </v-alert>
            </v-data-table>
            <v-dialog v-model="modalPaciente" width="500">  
                <v-card>
                    <v-card-title class="headline grey lighten-2" primary-title>
                        Paciente
                    </v-card-title>
                    <v-card-text>
                        <label>Tipo documento</label>
                        <select class="browser-default custom-select" v-model="seleccionado.tipo_documento">
                            <option value="-1" selected disabled>Elija un tipo de documento</option>
                            <option v-for="tipoDocumento in tiposDocumento" v-bind:value="tipoDocumento.id">@{{tipoDocumento.tipo_documento}}</option>
                        </select>
                        <label>Documento</label>
                        <input class="form-control" type="number" v-model="seleccionado.documento">                        
                        <label>Nombre y Apellido</label>
                        <input class="form-control" type="text" v-model="seleccionado.nombre_y_apellido">
                        <label>Fecha Nacimiento</label>
                        <input class="form-control" type="date" v-model="seleccionado.fecha_nacimiento">
                        <label>Celular</label>
                        <input class="form-control" type="text" v-model="seleccionado.celular">
                        <label>Telefono</label>
                        <input class="form-control" type="text" v-model="seleccionado.telefono">
                        <label>Direccion</label>
                        <input class="form-control" type="text" v-model="seleccionado.direccion">
                        <label>Localidad</label>
                        <input class="form-control" type="text" v-model="seleccionado.localidad">
                        <label>Obra Social</label>
                        <select class="browser-default custom-select" v-model="seleccionado.obra_social">
                            <option v-bind:value="-1" selected>Elija una obra social</option>
                            <option v-for="obrasocial in obraSociales" v-bind:value="obrasocial.id">@{{obrasocial.descripcion}}</option>
                        </select>
                        <label>Nro afiliado</label>
                        <input class="form-control" type="text" v-model="seleccionado.nro_afiliado">
                    </v-card-text>

                    <v-divider></v-divider>

                    <v-card-actions>
                        <v-spacer></v-spacer>
                        <v-btn color="black" flat @click="modalPaciente = false">
                            Cancelar
                        </v-btn>
                        <v-btn color="primary" v-on:click.prevent="confirmarPaciente">
                            Confirmar
                        </v-btn>
                    </v-card-actions>
                </v-card>
            </v-dialog>
        </v-card>
    </v-app>
</div>
@endsection

@section('scripts')
<script src="{{asset('js/funciones/funcionesPacientes.js')}}"></script>
@endsection