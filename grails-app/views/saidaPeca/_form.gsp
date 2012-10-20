<%@ page import="cmf.SaidaPeca" %>



<div class="fieldcontain ${hasErrors(bean: saidaPecaInstance, field: 'data', 'error')} required">
	<label for="data">
		<g:message code="saidaPeca.data.label" default="Data" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="data" precision="day"  value="${saidaPecaInstance?.data}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: saidaPecaInstance, field: 'peca', 'error')} required">
	<label for="peca">
		<g:message code="saidaPeca.peca.label" default="Peca" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="peca" name="peca.id" noSelection="['null':'Escolha...']" from="${cmf.Peca.list()}" optionKey="id" required="" value="${saidaPecaInstance?.peca?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: saidaPecaInstance, field: 'quantidade', 'error')} required">
	<label for="quantidade">
		<g:message code="saidaPeca.quantidade.label" default="Quantidade" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="quantidade" type="number" value="${saidaPecaInstance.quantidade}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: saidaPecaInstance, field: 'veiculo', 'error')} required">
	<label for="veiculo">
		<g:message code="saidaPeca.veiculo.label" default="Veiculo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="veiculo" name="veiculo.id" noSelection="['null':'Escolha...']" from="${cmf.Veiculo.list()}" optionKey="id" required="" value="${saidaPecaInstance?.veiculo?.id}" class="many-to-one"/>
</div>

