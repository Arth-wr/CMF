<%@ page import="cmf.Pneu" %>



<div class="fieldcontain ${hasErrors(bean: pneuInstance, field: 'tipoPneu', 'error')} required">
	<label for="tipoPneu">
		<g:message code="pneu.tipoPneu.label" default="Tipo Pneu" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tipoPneu" name="tipoPneu.id" from="${cmf.TipoPneu.list()}" optionKey="id" required="" value="${pneuInstance?.tipoPneu?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pneuInstance, field: 'preco', 'error')} required">
	<label for="preco">
		<g:message code="pneu.preco.label" default="Preco" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="preco" required="" value="${pneuInstance?.preco}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pneuInstance, field: 'dot', 'error')} required">
	<label for="dot">
		<g:message code="pneu.dot.label" default="Dot" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="dot" required="" value="${pneuInstance?.dot}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pneuInstance, field: 'fogo', 'error')} ">
	<label for="fogo">
		<g:message code="pneu.fogo.label" default="Fogo" />
		
	</label>
	<g:textField name="fogo" value="${pneuInstance?.fogo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pneuInstance, field: 'marca', 'error')} ">
	<label for="marca">
		<g:message code="pneu.marca.label" default="Marca" />
		
	</label>
	<g:textField name="marca" value="${pneuInstance?.marca}"/>
</div>

