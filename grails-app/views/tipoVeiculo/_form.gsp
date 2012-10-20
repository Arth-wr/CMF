<%@ page import="cmf.TipoVeiculo" %>



<div class="fieldcontain ${hasErrors(bean: tipoVeiculoInstance, field: 'numEixos', 'error')} required">
	<label for="numEixos">
		<g:message code="tipoVeiculo.numEixos.label" default="Num Eixos" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="numEixos" type="number" value="${tipoVeiculoInstance.numEixos}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: tipoVeiculoInstance, field: 'descricao', 'error')} required">
	<label for="descricao">
		<g:message code="tipoVeiculo.descricao.label" default="Descricao" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descricao" required="" value="${tipoVeiculoInstance?.descricao}"/>
</div>

