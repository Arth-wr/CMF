<%@ page import="cmf.TipoPneu" %>



<div class="fieldcontain ${hasErrors(bean: tipoPneuInstance, field: 'bitola', 'error')} required">
	<label for="bitola">
		<g:message code="tipoPneu.bitola.label" default="Bitola" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="bitola" required="" value="${tipoPneuInstance?.bitola}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tipoPneuInstance, field: 'desenho', 'error')} required">
	<label for="desenho">
		<g:message code="tipoPneu.desenho.label" default="Desenho" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="desenho" required="" value="${tipoPneuInstance?.desenho}"/>
</div>

