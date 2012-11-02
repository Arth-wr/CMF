
<%@ page import="cmf.StatusServico" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'statusServico.label', default: 'StatusServico')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-statusServico" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-statusServico" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="status" title="${message(code: 'statusServico.status.label', default: 'Status')}" />
					
						<g:sortableColumn property="fim" title="${message(code: 'statusServico.fim.label', default: 'Fim')}" />
					
						<g:sortableColumn property="inicio" title="${message(code: 'statusServico.inicio.label', default: 'Inicio')}" />
					
						<th><g:message code="statusServico.ordemServico.label" default="Ordem Servico" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${statusServicoInstanceList}" status="i" var="statusServicoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${statusServicoInstance.id}">${fieldValue(bean: statusServicoInstance, field: "status")}</g:link></td>
					
						<td><g:formatDate date="${statusServicoInstance.fim}" /></td>
					
						<td><g:formatDate date="${statusServicoInstance.inicio}" /></td>
					
						<td>${fieldValue(bean: statusServicoInstance, field: "ordemServico")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${statusServicoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
