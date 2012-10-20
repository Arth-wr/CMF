
<%@ page import="cmf.SaidaPeca" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'saidaPeca.label', default: 'SaidaPeca')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-saidaPeca" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-saidaPeca" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list saidaPeca">
			
				<g:if test="${saidaPecaInstance?.data}">
				<li class="fieldcontain">
					<span id="data-label" class="property-label"><g:message code="saidaPeca.data.label" default="Data" /></span>
					
						<span class="property-value" aria-labelledby="data-label"><g:formatDate date="${saidaPecaInstance?.data}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${saidaPecaInstance?.peca}">
				<li class="fieldcontain">
					<span id="peca-label" class="property-label"><g:message code="saidaPeca.peca.label" default="Peca" /></span>
					
						<span class="property-value" aria-labelledby="peca-label"><g:link controller="peca" action="show" id="${saidaPecaInstance?.peca?.id}">${saidaPecaInstance?.peca?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${saidaPecaInstance?.quantidade}">
				<li class="fieldcontain">
					<span id="quantidade-label" class="property-label"><g:message code="saidaPeca.quantidade.label" default="Quantidade" /></span>
					
						<span class="property-value" aria-labelledby="quantidade-label"><g:fieldValue bean="${saidaPecaInstance}" field="quantidade"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${saidaPecaInstance?.veiculo}">
				<li class="fieldcontain">
					<span id="veiculo-label" class="property-label"><g:message code="saidaPeca.veiculo.label" default="Veiculo" /></span>
					
						<span class="property-value" aria-labelledby="veiculo-label"><g:link controller="veiculo" action="show" id="${saidaPecaInstance?.veiculo?.id}">${saidaPecaInstance?.veiculo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${saidaPecaInstance?.id}" />
					<g:link class="edit" action="edit" id="${saidaPecaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
