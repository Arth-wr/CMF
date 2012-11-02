<%@ page import="cmf.StatusServico" %>



<div class="fieldcontain ${hasErrors(bean: statusServicoInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="statusServico.status.label" default="Status" />
		
	</label>
	<g:select name="status" from="${statusServicoInstance.constraints.status.inList}" value="${statusServicoInstance?.status}" valueMessagePrefix="statusServico.status" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: statusServicoInstance, field: 'fim', 'error')} required">
	<label for="fim">
		<g:message code="statusServico.fim.label" default="Fim" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fim" precision="day"  value="${statusServicoInstance?.fim}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: statusServicoInstance, field: 'inicio', 'error')} required">
	<label for="inicio">
		<g:message code="statusServico.inicio.label" default="Inicio" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="inicio" precision="day"  value="${statusServicoInstance?.inicio}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: statusServicoInstance, field: 'ordemServico', 'error')} required">
	<label for="ordemServico">
		<g:message code="statusServico.ordemServico.label" default="Ordem Servico" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="ordemServico" name="ordemServico.id" from="${cmf.OrdemServico.list()}" optionKey="id" required="" value="${statusServicoInstance?.ordemServico?.id}" class="many-to-one"/>
</div>

