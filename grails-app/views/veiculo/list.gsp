
<%@ page import="cmf.Veiculo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'veiculo.label', default: 'Veiculo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-veiculo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-veiculo" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="chassi" title="${message(code: 'veiculo.chassi.label', default: 'Chassi')}" />
					
						<g:sortableColumn property="placa" title="${message(code: 'veiculo.placa.label', default: 'Placa')}" />
					
						<th><g:message code="veiculo.tipoVeiculo.label" default="Tipo Veiculo" /></th>
					
						<g:sortableColumn property="cor" title="${message(code: 'veiculo.cor.label', default: 'Cor')}" />
					
						<g:sortableColumn property="marca" title="${message(code: 'veiculo.marca.label', default: 'Marca')}" />
					
						<g:sortableColumn property="modelo" title="${message(code: 'veiculo.modelo.label', default: 'Modelo')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${veiculoInstanceList}" status="i" var="veiculoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${veiculoInstance.id}">${fieldValue(bean: veiculoInstance, field: "chassi")}</g:link></td>
					
						<td>${fieldValue(bean: veiculoInstance, field: "placa")}</td>
					
						<td>${fieldValue(bean: veiculoInstance, field: "tipoVeiculo")}</td>
					
						<td>${fieldValue(bean: veiculoInstance, field: "cor")}</td>
					
						<td>${fieldValue(bean: veiculoInstance, field: "marca")}</td>
					
						<td>${fieldValue(bean: veiculoInstance, field: "modelo")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${veiculoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
