var facturador = {
    detalle: {
        igv:      0,
        total:    0,
        subtotal: 0,
        items:    []
    },

    /* Encargado de agregar un producto a nuestra colección */
    registrar: function(item)
    {
        /* Agregamos el total */
        item.total = (item.cantidad * item.precio);

        this.detalle.items.push(item);

        this.refrescar();
    },

    /* Encargado de actualizar el precio/cantidad de un producto */
    actualizar: function(id, row)
    {
        /* Capturamos la fila actual para buscar los controles por sus nombres */
        row = $(row).closest('.list-group-item');

        /* Buscamos la columna que queremos actualizar */
        $(this.detalle.items).each(function(indice, fila){
            if(indice == id)
            {
                /* Agregamos un nuevo objeto para reemplazar al anterior */
                facturador.detalle.items[indice] = {
                    producto: row.find("input[name='producto']").val(),
                    cantidad: row.find("input[name='cantidad']").val(),
                    precio:   row.find("input[name='precio']").val(),
                    descuento:   row.find("input[name='descuento']").val()
                };

                facturador.detalle.items[indice].total = facturador.detalle.items[indice].precio *
                                                         facturador.detalle.items[indice].cantidad-
                                                         facturador.detalle.items[indice].descuento;

                return false;
            }
        })

        this.refrescar();
    },

    /* Encargado de retirar el producto seleccionado */
    retirar: function(id)
    {
        /* Declaramos un ID para cada fila */
        $(this.detalle.items).each(function(indice, fila){
            if(indice == id)
            {
                facturador.detalle.items.splice(id, 1);
                return false;
            }
        })

        this.refrescar();
    },

    /* Refresca todo los productos elegidos */
    refrescar: function()
    {
        this.detalle.total = 0;

        /* Declaramos un id y calculamos el total */
        $(this.detalle.items).each(function(indice, fila){
            facturador.detalle.items[indice].id = indice;
            facturador.detalle.total += fila.total;
        })

        /* Calculamos el subtotal e IGV */
        this.detalle.igv      = (this.detalle.total * 0.18).toFixed(2); // 18 % El IGV y damos formato a 2 deciamles
        this.detalle.subtotal = (this.detalle.total - this.detalle.igv).toFixed(2); // Total - IGV y formato a 2 decimales
        this.detalle.total    = this.detalle.total.toFixed(2);

        var template   = $.templates("#facturador-detalle-template");
        var htmlOutput = template.render(this.detalle);

        $("#facturador-detalle").html(htmlOutput);
    }
};

$(document).ready(function(){
    $("#btn-agregar").click(function(){
        facturador.registrar({
            producto: $("#producto").val(),
            cantidad: $("#cantidad").val(),
            precio:   $("#precio").val(),
        });

        $("#producto").val('');
        $("#precio").val('');
        $("#cantidad").val('');
    })
})