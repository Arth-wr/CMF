
<%@ page import="cmf.StatusServico" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'statusServico.label', default: 'StatusServico')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-statusServico" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-statusServico" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list statusServico">
			
				<g:if test="${statusServicoInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="statusServico.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${statusServicoInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${statusServicoInstance?.fim}">
				<li class="fieldcontain">
					<span id="fim-label" class="property-label"><g:message code="statusServico.fim.label" default="Fim" /></span>
					
						<span class="property-value" aria-labelledby="fim-label"><g:formatDate date="${statusServicoInstance?.fim}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${statusServicoInstance?.inicio}">
				<li class="fieldcontain">
					<span id="inicio-label" class="property-label"><g:message code="statusServico.inicio.label" default="Inicio" /></span>
					
						<span class="property-value" aria-labelledby="inicio-label"><g:formatDate date="${statusServicoInstance?.inicio}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${statusServicoInstance?.ordemServico}">
				<li class="fieldcontain">
					<span id="ordemServico-label" class="property-label"><g:message code="statusServico.ordemServico.label" default="Ordem Servico" /></span>
					
						<span class="property-value" aria-labelledby="ordemServico-label"><g:link controller="ordemServico" action="show" id="${statusServicoInstance?.ordemServico?.id}">${statusServicoInstance?.ordemServico?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${statusServicoInstance?.id}" />
					<g:link class="edit" action="edit" id="${statusServicoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
