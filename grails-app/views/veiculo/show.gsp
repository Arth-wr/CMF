
<%@ page import="cmf.Veiculo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'veiculo.label', default: 'Veiculo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-veiculo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-veiculo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list veiculo">
			
				<g:if test="${veiculoInstance?.chassi}">
				<li class="fieldcontain">
					<span id="chassi-label" class="property-label"><g:message code="veiculo.chassi.label" default="Chassi" /></span>
					
						<span class="property-value" aria-labelledby="chassi-label"><g:fieldValue bean="${veiculoInstance}" field="chassi"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${veiculoInstance?.placa}">
				<li class="fieldcontain">
					<span id="placa-label" class="property-label"><g:message code="veiculo.placa.label" default="Placa" /></span>
					
						<span class="property-value" aria-labelledby="placa-label"><g:fieldValue bean="${veiculoInstance}" field="placa"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${veiculoInstance?.tipoVeiculo}">
				<li class="fieldcontain">
					<span id="tipoVeiculo-label" class="property-label"><g:message code="veiculo.tipoVeiculo.label" default="Tipo Veiculo" /></span>
					
						<span class="property-value" aria-labelledby="tipoVeiculo-label"><g:link controller="tipoVeiculo" action="show" id="${veiculoInstance?.tipoVeiculo?.id}">${veiculoInstance?.tipoVeiculo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${veiculoInstance?.cor}">
				<li class="fieldcontain">
					<span id="cor-label" class="property-label"><g:message code="veiculo.cor.label" default="Cor" /></span>
					
						<span class="property-value" aria-labelledby="cor-label"><g:fieldValue bean="${veiculoInstance}" field="cor"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${veiculoInstance?.marca}">
				<li class="fieldcontain">
					<span id="marca-label" class="property-label"><g:message code="veiculo.marca.label" default="Marca" /></span>
					
						<span class="property-value" aria-labelledby="marca-label"><g:fieldValue bean="${veiculoInstance}" field="marca"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${veiculoInstance?.modelo}">
				<li class="fieldcontain">
					<span id="modelo-label" class="property-label"><g:message code="veiculo.modelo.label" default="Modelo" /></span>
					
						<span class="property-value" aria-labelledby="modelo-label"><g:fieldValue bean="${veiculoInstance}" field="modelo"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${veiculoInstance?.id}" />
					<g:link class="edit" action="edit" id="${veiculoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                                        <g:link controller="localPneu" id="${veiculoInstance?.id}" action="create"  >Pneus</g:link>
                                        
				</fieldset>
			</g:form>
		</div>
                
                
                
	</body>
</html>
