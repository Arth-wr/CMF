<%@ page import="cmf.OrdemServico" %>



<div class="fieldcontain ${hasErrors(bean: ordemServicoInstance, field: 'saida', 'error')} ">
	<label for="saida">
		<g:message code="ordemServico.saida.label" default="Saida" />
		
	</label>
	<g:datePicker name="saida" precision="day"  value="${ordemServicoInstance?.saida}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: ordemServicoInstance, field: 'emAberto', 'error')} ">
	<label for="emAberto">
		<g:message code="ordemServico.emAberto.label" default="Em Aberto" />
		
	</label>
	<g:checkBox name="emAberto" value="${ordemServicoInstance?.emAberto}" />
</div>

<div class="fieldcontain ${hasErrors(bean: ordemServicoInstance, field: 'entrada', 'error')} required">
	<label for="entrada">
		<g:message code="ordemServico.entrada.label" default="Entrada" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="entrada" precision="day"  value="${ordemServicoInstance?.entrada}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: ordemServicoInstance, field: 'servicos', 'error')} ">
	<label for="servicos">
		<g:message code="ordemServico.servicos.label" default="Servicos" />
		
	</label>
	<g:select name="servicos" from="${cmf.Servico.list()}" multiple="multiple" optionKey="id" size="5" value="${ordemServicoInstance?.servicos*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ordemServicoInstance, field: 'statusServico', 'error')} ">
	<label for="statusServico">
		<g:message code="ordemServico.statusServico.label" default="Status Servico" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${ordemServicoInstance?.statusServico?}" var="s">
    <li><g:link controller="statusServico" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="statusServico" action="create" params="['ordemServico.id': ordemServicoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'statusServico.label', default: 'StatusServico')])}</g:link>
</li>
</ul>

</div>

