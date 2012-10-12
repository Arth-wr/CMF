<%@ page import="cmf.Servico" %>



<div class="fieldcontain ${hasErrors(bean: servicoInstance, field: 'descricao', 'error')} required">
	<label for="descricao">
		<g:message code="servico.descricao.label" default="Descricao" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descricao" required="" value="${servicoInstance?.descricao}"/> 
</div>

