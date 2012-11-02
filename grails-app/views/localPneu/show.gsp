
<%@ page import="cmf.LocalPneu" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'localPneu.label', default: 'LocalPneu')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-localPneu" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-localPneu" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list localPneu">
			
				<g:if test="${localPneuInstance?.veiculo}">
				<li class="fieldcontain">
					<span id="veiculo-label" class="property-label"><g:message code="localPneu.veiculo.label" default="Veiculo" /></span>
					
						<span class="property-value" aria-labelledby="veiculo-label"><g:link controller="veiculo" action="show" id="${localPneuInstance?.veiculo?.id}">${localPneuInstance?.veiculo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${localPneuInstance?.pneu}">
				<li class="fieldcontain">
					<span id="pneu-label" class="property-label"><g:message code="localPneu.pneu.label" default="Pneu" /></span>
					
						<span class="property-value" aria-labelledby="pneu-label"><g:link controller="pneu" action="show" id="${localPneuInstance?.pneu?.id}">${localPneuInstance?.pneu?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${localPneuInstance?.posicao}">
				<li class="fieldcontain">
					<span id="posicao-label" class="property-label"><g:message code="localPneu.posicao.label" default="Posicao" /></span>
					
						<span class="property-value" aria-labelledby="posicao-label"><g:fieldValue bean="${localPneuInstance}" field="posicao"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${localPneuInstance?.id}" />
					<g:link class="edit" action="edit" id="${localPneuInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
