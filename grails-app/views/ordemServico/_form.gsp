<%@ page import="cmf.OrdemServico" %>



<div class="fieldcontain ${hasErrors(bean: ordemServicoInstance, field: 'entrada', 'error')} required">
	<label for="entrada">
		<g:message code="ordemServico.entrada.label" default="Entrada" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="entrada" precision="minute"  value="${ordemServicoInstance?.entrada}"  />
</div>

<br>
<label >
		<g:message code="ordemServico.saida.label" default="Serviços" />
	</label>

<input id="ordemAuto" size="70" />
  
    <a href="#" id="addButton">Adicionar</a>
    
  <br><br>
    <table id="servicos">
      <tr>
            <th>Serviços</th>   
        </tr> 
        
        <g:each in="${ordemServicoInstance.servicos}" var="s">
          <tr>
            <th ><span><g:link controller="servico" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link><button id="excluir" name="Excluir"> Excluir </button></span></th> 
          </tr>
      <!--    <tr> <th><input id="${s.id}" value="${s.id}" name="service.id" type="hidden" /></th> </tr>-->
        </g:each>

    </table>
  
  

    <div id="res">
    </div>

    <g:hiddenField name="listaServicos" value="AddValor" />
    
    <g:hiddenField id="idserviceAdd" name="idserviceAdd" />


<script> 
  $( "#addButton" ).click(function() {

	  if ( $( '#idserviceAdd').val() != null && $('#ordemAuto').val() ){
	  
		  var input = document.createElement('input');
		  $(input).attr("value", $( '#idserviceAdd').val() );
		  $(input).attr("name", 'service.id' );
		  $(input).attr("type", 'hidden' );

		  $('<tr>' + '<td>' + $('#ordemAuto').val() + input.outerHTML  +  '</td>' + '</tr>').appendTo($('#servicos'));
		
		  $( '#idserviceAdd').val("");
		  $('#ordemAuto').val("");
	  }
  });

</script>