<%@ page import="cmf.Veiculo" %>



<div class="fieldcontain ${hasErrors(bean: veiculoInstance, field: 'chassi', 'error')} required">
	<label for="chassi">
		<g:message code="veiculo.chassi.label" default="Chassi" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="chassi" required="" value="${veiculoInstance?.chassi}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: veiculoInstance, field: 'placa', 'error')} required">
	<label for="placa">
		<g:message code="veiculo.placa.label" default="Placa" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="placa" required="" value="${veiculoInstance?.placa}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: veiculoInstance, field: 'tipoVeiculo', 'error')} required">
	<label for="tipoVeiculo">
		<g:message code="veiculo.tipoVeiculo.label" default="Tipo Veiculo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tipoVeiculo" name="tipoVeiculo.id" from="${cmf.TipoVeiculo.list()}" optionKey="id" required="" value="${veiculoInstance?.tipoVeiculo?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: veiculoInstance, field: 'cor', 'error')} ">
	<label for="cor">
		<g:message code="veiculo.cor.label" default="Cor" />
		
	</label>
	<g:textField name="cor" value="${veiculoInstance?.cor}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: veiculoInstance, field: 'marca', 'error')} ">
	<label for="marca">
		<g:message code="veiculo.marca.label" default="Marca" />
		
	</label>
	<g:textField name="marca" value="${veiculoInstance?.marca}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: veiculoInstance, field: 'modelo', 'error')} ">
	<label for="modelo">
		<g:message code="veiculo.modelo.label" default="Modelo" />
		
	</label>
	<g:textField name="modelo" value="${veiculoInstance?.modelo}"/>
</div>

