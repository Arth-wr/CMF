<%@ page import="cmf.OrdemServico" %>

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
    <input id="ordemAuto"  value="" /> <span id="addButton">Add</span>

    <g:hiddenField id="idserviceAdd" name="idserviceAdd" />

    <ol id="servicos">
    </ol>     

    <div id="res"></div>

    <g:hiddenField name="listaServicos" value="AddValor" />
  </div>

    <ul class="one-to-many">
<g:each in="${ordemServicoInstance?.statusServico?}" var="s">
    <li><g:link controller="statusServico" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="statusServico" action="create" params="['ordemServico.id': ordemServicoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'statusServico.label', default: 'StatusServico')])}</g:link>
</li>
</ul>
	
        ${service}

<script>

  $( "#addButton" ).click(function() {

	  if ( $( '#idserviceAdd').val() != null && $('#ordemAuto').val() ){

                 // alert($('#idserviceAdd').val());
                 // alert($('#ordemAuto').val());
	  
		  var input = document.createElement('input');
		  $(input).attr("value", $( '#idserviceAdd').val() );
                 // $(input).attr("value", '\$\{ordemServicoInstance?.servicos*.id}' );
		  $(input).attr("name", 'service.id' );
		  $(input).attr("type", 'hidden' );
                  //$(input).attr("id", 'service' );
		 // alert (input.outerHTML);

		  $('<li>' + $('#ordemAuto').val() + input.outerHTML  +  '</li>').appendTo($('#servicos'));
		
		  $( '#idserviceAdd').val("");
		  $('#ordemAuto').val("");
                  //alert($('#service').val());
	  }
  });

</script>
