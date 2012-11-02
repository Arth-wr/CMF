<%@ page import="cmf.LocalPneu" %>



<div class="fieldcontain ${hasErrors(bean: localPneuInstance, field: 'veiculo', 'error')} required">
	<label for="veiculo">
		<g:message code="localPneu.veiculo.label" default="Veiculo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="veiculo" name="veiculo.id" from="${cmf.Veiculo.list()}" optionKey="id" required="" value="${localPneuInstance?.veiculo?.id}" class="many-to-one"/>
        <input name="veiculo.id" value="${params.id}"/>
        >${veiculo}<
</div>
