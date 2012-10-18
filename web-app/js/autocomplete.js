  $(function() {
        function log( message ) {
            $( "<div>" ).text( message ).prependTo( "#log" );
            $( "#log" ).scrollTop( 0 );
        }
 
        $( "#ordemAuto" ).autocomplete({
            source: function( request, response ) {
                $.ajax({
                    url: '/CMF/servico/searchJSON' ,
                    dataType: "json",
                    data: {
                       // featureClass: "P",
                       // style: "full",
                        maxRows: 12,
                        name_startsWith: request.term
                    },
                    success: function( data ) {
                        response( $.map( data, function( item ) {
                        	
                            return {
                                label: item.descricao,
                                value: item.id
                            }
                        }));
                    }
                });
            },
            minLength: 2,
            select: function( event, ui ) {
            	
            	
            	
                log( ui.item ?
                    "Selected: " + ui.item.value :
                    "Nothing selected, input was " + this.value);
                
                $( "#idserviceAdd").val(ui.item.value);
                
                ui.item.value = ui.item.label;
                
                
                
            },
            open: function() {
                $( this ).removeClass( "ui-corner-all" ).addClass( "ui-corner-top" );
            },
            close: function() {
                $( this ).removeClass( "ui-corner-top" ).addClass( "ui-corner-all" );
            }
        });
    });