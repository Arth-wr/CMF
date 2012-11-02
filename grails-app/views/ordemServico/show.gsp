
<%@ page import="cmf.OrdemServico" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ordemServico.label', default: 'OrdemServico')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-ordemServico" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-ordemServico" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list ordemServico">
			
				<g:if test="${ordemServicoInstance?.saida}">
				<li class="fieldcontain">
					<span id="saida-label" class="property-label"><g:message code="ordemServico.saida.label" default="Saida" /></span>
					
						<span class="property-value" aria-labelledby="saida-label"><g:formatDate date="${ordemServicoInstance?.saida}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${ordemServicoInstance?.emAberto}">
				<li class="fieldcontain">
					<span id="emAberto-label" class="property-label"><g:message code="ordemServico.emAberto.label" default="Em Aberto" /></span>
					
						<span class="property-value" aria-labelledby="emAberto-label"><g:formatBoolean boolean="${ordemServicoInstance?.emAberto}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${ordemServicoInstance?.entrada}">
				<li class="fieldcontain">
					<span id="entrada-label" class="property-label"><g:message code="ordemServico.entrada.label" default="Entrada" /></span>
					
						<span class="property-value" aria-labelledby="entrada-label"><g:formatDate date="${ordemServicoInstance?.entrada}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${ordemServicoInstance?.servicos}">
				<li class="fieldcontain">
					<span id="servicos-label" class="property-label"><g:message code="ordemServico.servicos.label" default="Servicos" /></span>
					
						<g:each in="${ordemServicoInstance.servicos}" var="s">
						<span class="property-value" aria-labelledby="servicos-label"><g:link controller="servico" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${ordemServicoInstance?.statusServico}">
				<li class="fieldcontain">
					<span id="statusServico-label" class="property-label"><g:message code="ordemServico.statusServico.label" default="Status Servico" /></span>
					
						<g:each in="${ordemServicoInstance.statusServico}" var="s">
						<span class="property-value" aria-labelledby="statusServico-label"><g:link controller="statusServico" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${ordemServicoInstance?.id}" />
					<g:link class="edit" action="edit" id="${ordemServicoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
