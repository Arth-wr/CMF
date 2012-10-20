
<%@ page import="cmf.TipoVeiculo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tipoVeiculo.label', default: 'TipoVeiculo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-tipoVeiculo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-tipoVeiculo" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="numEixos" title="${message(code: 'tipoVeiculo.numEixos.label', default: 'Num Eixos')}" />
					
						<g:sortableColumn property="descricao" title="${message(code: 'tipoVeiculo.descricao.label', default: 'Descricao')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${tipoVeiculoInstanceList}" status="i" var="tipoVeiculoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${tipoVeiculoInstance.id}">${fieldValue(bean: tipoVeiculoInstance, field: "numEixos")}</g:link></td>
					
						<td>${fieldValue(bean: tipoVeiculoInstance, field: "descricao")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${tipoVeiculoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
