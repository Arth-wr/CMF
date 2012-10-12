<%@ page import="cmf.OrdemServico" %>

        <head>
            <resource:autoComplete skin="default" /> 
            <g:javascript library="jquery"/>
	</head>
<div class="fieldcontain ${hasErrors(bean: ordemServicoInstance, field: 'entrada', 'error')} required">
	<label for="entrada">
		<g:message code="ordemServico.entrada.label" default="Entrada" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="entrada" precision="day"  value="${ordemServicoInstance?.entrada}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: ordemServicoInstance, field: 'saida', 'error')} required">
	<label for="saida">
		<g:message code="ordemServico.saida.label" default="Saida" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="saida" precision="day"  value="${ordemServicoInstance?.saida}"  />
</div>

<div>
  <richui:autoComplete name="service" action="${createLinkTo('dir': 'Servico/searchAJAX')}" id="auto" 
                       onItemSelect="alert($('#res'))"
                       />
        
   
   <div id="res"></div>
  
         <p id="addButton">Add</p>
         <g:actionSubmit value="Adicionar" action="insereServico" /><br>
          Servico    ${servico} <br>
          listaServico    ${listaServicos} <br>
          sessao    ${session.sessao}<br>
          
          <g:hiddenField name="listaServicos" value="AddValor" />
          
</div>

<div class="fieldcontain ${hasErrors(bean: ordemServicoInstance, field: 'servicos', 'error')} ">
	<label for="servicos">
		<g:message code="ordemServico.servicos.label" default="Servicos" />
		
	</label>
	<!--<g:select name="servicos" from="${cmf.Servico.list()}" multiple="multiple" optionKey="id" size="5" value="${ordemServicoInstance?.servicos*.id}" class="many-to-many"/>-->
        <g:select name="servicos" from="${listaServicos}" multiple="multiple" optionKey="id" size="5" value="${ordemServicoInstance?.servicos*.id}" class="many-to-many"/>
    </div>	


<script>
	$(function() {
         var link = '<g:createLinkTo controller='empresa' action='autocomplete'/>' + "/empresa/autocomplete";
        // "mind/empresa/autocomplete";
	// alert(link);
	<%-- <g:link controller="empresa" action="listEmpresaByCategoria"> --%>
	 $(".ui-widget").autocomplete({
	        source: function(request, response){
        	    	  $.ajax({
	                	url: link
, // remote datasource
		                data: request,
				success: function( data ) {
						response( $.map( data, function( item ) {
							return {
								label: item.nome +" - " +  item.bairro,
								value: item.id + " - " + item.nome,
								obj: item
							}
						}));
				},
		                error: function(){ // handle server errors
                		    $.jGrowl("Unable to retrieve Companies", {
	                          theme: 'ui-state-error ui-corner-all'              
                    				});
                			}
            			});
        		},
		minLength: 1, // triggered only after minimum 2 characters have been entered.
        select: function(event, ui) { // event handler when user selects a company from the list.
	    //var id = '#categoria' + ui.item.obj.categoria.id;
	    //$(id).val(ui.item.obj.id);
        }
    });
});
	</script>
