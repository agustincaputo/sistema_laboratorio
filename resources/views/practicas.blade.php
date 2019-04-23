@extends('base.base')

@section('content')

<div style="text-align: center" class="h1">Sección de prácticas</div>

<div id="app">
    <v-app id="inspire">
        <v-card>
            <v-card-title>
                <button class="btn btn-primary" v-on:click="nuevaPractica()">Nueva Practica</button>
                <v-spacer></v-spacer>        
                <v-text-field v-model="search" append-icon="search" label="Buscar" single-line hide-details></v-text-field>
            </v-card-title>
            <v-data-table :headers="headers" :items="practicas" :search="search">
                <template slot="items" slot-scope="props">
                    <td>@{{ props.item.id }}</td>
                    <td>@{{ props.item.descripcion }}</td>
                    <td>@{{ props.item.material }}</td>
                    <td>@{{ props.item.precio }}</td>
                    <td><button class="btn btn-elegant btn-" v-on:click="">Abrir</button></td>
                    <td><i class="fa fa-times fa-2x" style="color: red"></i></td>
                </template>
                <v-alert slot="no-results" :value="true" color="error" icon="warning">
                    El campo de busqueda "@{{ search }}" no encontró resultados.
                </v-alert>
            </v-data-table>
            <v-dialog v-model="modalPractica" width="600">  
                <v-card>
                    <v-card-title class="headline grey lighten-2" primary-title>
                        Practica
                    </v-card-title>
                    <v-card-text>
                    <b>Descripcion: </b><input type="text" v-model="seleccionada.descripcion"><br>
                    <b>Material: </b><input type="text" v-model="seleccionada.material"><br>
                    <b>Precio: </b><input type="text" v-model="seleccionada.precio"><br>
                    <b>Observacion: </b><input type="text" v-model="seleccionada.observacion"><br>
                    <b>Subprácticas:</b>
                    <br>
                    <table class="table table-hover table-bordered">
                        <thead>
                            <tr>
                                <th>Descripcion</th>
                                <th>Unidad</th>
                                <th>Valor de referencia</th>
                                <th>Eliminar</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="(item,index) in seleccionada.detalle">
                                <td><input type="text" v-model="item.descripcion"></td>
                                <td><input type="text" v-model="item.unidad"></td>
                                <td><input type="text" v-model="item.valor_referencia"></td>
                                <td><a v-on:click="eliminarDetalle(index)" v-if="seleccionada.detalle.length>1"><i class="fa fa-trash"></i></a></button></td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="offset-11"><a v-on:click="agregarDetalle()"><i class="fa fa-plus-circle fa-2x"></i></a></div>
                    </v-card-text>
                    <v-divider></v-divider>
                    <v-card-actions>
                        <v-spacer></v-spacer>
                        <v-btn color="black" flat @click="modalPractica = false">
                            Cancelar
                        </v-btn>
                        <v-btn color="primary" flat @click="modalPractica = false">
                            Guardar
                        </v-btn>
                    </v-card-actions>
                </v-card>
            </v-dialog>
        </v-card>
    </v-app>
</div>

@endsection

@section('scripts')
    <script src="{{asset('js/funciones/funcionesPracticas.js')}}"></script>
@endsection