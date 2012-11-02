
<%@ page import="cmf.Pneu" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pneu.label', default: 'Pneu')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-pneu" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-pneu" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list pneu">
			
				<g:if test="${pneuInstance?.tipoPneu}">
				<li class="fieldcontain">
					<span id="tipoPneu-label" class="property-label"><g:message code="pneu.tipoPneu.label" default="Tipo Pneu" /></span>
					
						<span class="property-value" aria-labelledby="tipoPneu-label"><g:link controller="tipoPneu" action="show" id="${pneuInstance?.tipoPneu?.id}">${pneuInstance?.tipoPneu?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${pneuInstance?.preco}">
				<li class="fieldcontain">
					<span id="preco-label" class="property-label"><g:message code="pneu.preco.label" default="Preco" /></span>
					
						<span class="property-value" aria-labelledby="preco-label"><g:fieldValue bean="${pneuInstance}" field="preco"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pneuInstance?.dot}">
				<li class="fieldcontain">
					<span id="dot-label" class="property-label"><g:message code="pneu.dot.label" default="Dot" /></span>
					
						<span class="property-value" aria-labelledby="dot-label"><g:fieldValue bean="${pneuInstance}" field="dot"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pneuInstance?.fogo}">
				<li class="fieldcontain">
					<span id="fogo-label" class="property-label"><g:message code="pneu.fogo.label" default="Fogo" /></span>
					
						<span class="property-value" aria-labelledby="fogo-label"><g:fieldValue bean="${pneuInstance}" field="fogo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pneuInstance?.marca}">
				<li class="fieldcontain">
					<span id="marca-label" class="property-label"><g:message code="pneu.marca.label" default="Marca" /></span>
					
						<span class="property-value" aria-labelledby="marca-label"><g:fieldValue bean="${pneuInstance}" field="marca"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${pneuInstance?.id}" />
					<g:link class="edit" action="edit" id="${pneuInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
