var app = new Vue({
        el: '#app',
        data() {
            return {
                search: '',
                headers: [
                    {text: 'Id', value: 'id'},
                    {text: 'Descripcion', value: 'descripcio'},
                    {text: 'Material', value: 'material'},
                    {text: 'Precio', value: 'precio'},
                    {text: 'Abrir', value: 'id'}
                ],
                practicas: [],
                seleccionada: new Object({id:"",descripcion:"",observacion:"",material:"",precio:"",detalle:[{id:"",descripcion:"",unidad:"",valor_referencia:""}]}),
                modalPractica: false
            };
        },
        methods: {
            nuevaPractica: function()
            {
                this.seleccionada = {id:"",descripcion:"",observacion:"",material:"",precio:"",detalle:[{id:"",descripcion:"",unidad:"",valor_referencia:""}]};
                this.modalPractica = true;
            },
            eliminarDetalle: function(index)
            {
                this.seleccionada.detalle.splice(index,1);
            },
            agregarDetalle: function()
            {
                this.seleccionada.detalle.push({id:"",descripcion:"",unidad:"",valor_referencia:""});
            }
        }
    });