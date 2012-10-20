<%@ page import="cmf.Peca" %>



<div class="fieldcontain ${hasErrors(bean: pecaInstance, field: 'referencia', 'error')} ">
	<label for="referencia">
		<g:message code="peca.referencia.label" default="Referencia" />
		
	</label>
	<g:textField name="referencia" value="${pecaInstance?.referencia}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pecaInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="peca.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${pecaInstance?.nome}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pecaInstance, field: 'localizacao', 'error')} ">
	<label for="localizacao">
		<g:message code="peca.localizacao.label" default="Localizacao" />
		
	</label>
	<g:textField name="localizacao" value="${pecaInstance?.localizacao}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pecaInstance, field: 'marca', 'error')} ">
	<label for="marca">
		<g:message code="peca.marca.label" default="Marca" />
		
	</label>
	<g:textField name="marca" value="${pecaInstance?.marca}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pecaInstance, field: 'quantidade', 'error')} required">
	<label for="quantidade">
		<g:message code="peca.quantidade.label" default="Quantidade" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="quantidade" type="number" value="${pecaInstance.quantidade}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: pecaInstance, field: 'quantidadeMinima', 'error')} required">
	<label for="quantidadeMinima">
		<g:message code="peca.quantidadeMinima.label" default="Quantidade Minima" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="quantidadeMinima" type="number" value="${pecaInstance.quantidadeMinima}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: pecaInstance, field: 'referenciaTecnica', 'error')} ">
	<label for="referenciaTecnica">
		<g:message code="peca.referenciaTecnica.label" default="Referencia Tecnica" />
		
	</label>
	<g:textField name="referenciaTecnica" value="${pecaInstance?.referenciaTecnica}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pecaInstance, field: 'valorCompra', 'error')} required">
	<label for="valorCompra">
		<g:message code="peca.valorCompra.label" default="Valor Compra" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="valorCompra" value="${fieldValue(bean: pecaInstance, field: 'valorCompra')}" required=""/>
</div>

