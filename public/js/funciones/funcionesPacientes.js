var app = new Vue({
        el: '#app',
        data() {
            return {
                search: '',
                headers: [
                    {text: 'Id', value: 'id'},
                    {text: 'Documento', value: ''},
                    {text: 'Nombre y Apellido', value: 'nombre_y_apellido'},
                    {text: 'Editar', value: ''},
                    {text: 'Eliminar', value: ''}
                ],
                pacientes: [],
                seleccionado: new Object({id: '',tipo_documento:'',documento:'', nombre_y_apellido: '', fecha_nacimiento: '',
                                          celular: '', telefono: '', direccion: '', localidad: '', obra_social: '', nro_afiliado: ''}),
                tiposDocumento: [],
                obraSocialSeleccionada: -1,
                obraSociales: [],
                modalPaciente: false,
                accion: ''
            }
        },
        methods: {
            cargarPacientes: function()
            {
                axios({
                    url: 'pacientes',
                    method: 'get'
                }).then(function(response)
                {
                    app.pacientes = response.data;
                });
            },
            nuevoPaciente: function ()
            {
                this.seleccionado = new Object({id: '',tipo_documento:'',documento:'', nombre_y_apellido: '', fecha_nacimiento: '',
                                          celular: '', telefono: '', direccion: '', localidad: '', obra_social: '', nro_afiliado: ''});
                this.accion = 'nuevo';
                this.modalPaciente = true;
            },
            modificarPaciente: function(paciente)
            {
                this.accion = 'modificar';
                axios({
                    url: 'pacientes/buscar/'+paciente.id,
                    method: 'get'
                }).then(function(response)
                {
                    app.seleccionado = response.data[0];
                });
                this.modalPaciente = true;
                
            },
            confirmarPaciente: function()
            {
                
                if(this.accion == 'nuevo')
                {
                    axios({
                        url:'pacientes',
                        method: 'post',
                        data: app.seleccionado                         
                    }).then(function(response)
                    {
                        alert('Paciente Ingresado');
                        app.cargarPacientes();
                        app.modalPaciente = false;
                        
                    }).catch(function(error)
                    {
                       alert('Error: '+error); 
                    });
                }
                if(this.accion == 'modificar')
                {
                    axios({
                       url: 'pacientes',
                       method: 'put',
                       data: app.seleccionado
                    }).then(function(response)
                    {
                        alert('Paciente Modificado');
                        app.cargarPacientes();
                        app.modalPaciente = false;
                    });
                }
            },
            cargarObraSociales: function()
            {
                axios({
                    url: 'obrasocial',
                    method: 'get'
                }).then(function(response)
                {
                    app.obraSociales = response.data;
                });
            },
            cargarTiposDocumento: function()
            {
                axios({
                    url: 'pacientes/tipo_documento',
                    method: 'get'
                }).then(function(response)
                {
                    app.tiposDocumento = response.data;
                });
            },
            eliminarPaciente: function(id)
            {
                axios({
                    url: 'pacientes',
                    method: 'delete',
                    data: {id: id}
                }).then(function(response)
                {
                    alert("Se ha borrado el paciente correctamente");
                    app.cargarPacientes();
                });
            }
        }
    });
    app.cargarPacientes();
    app.cargarObraSociales();
    app.cargarTiposDocumento();