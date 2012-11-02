
<%@ page import="cmf.LocalPneu" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'localPneu.label', default: 'LocalPneu')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-localPneu" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-localPneu" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="localPneu.veiculo.label" default="Veiculo" /></th>
					
						<th><g:message code="localPneu.pneu.label" default="Pneu" /></th>
					
						<g:sortableColumn property="posicao" title="${message(code: 'localPneu.posicao.label', default: 'Posicao')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${localPneuInstanceList}" status="i" var="localPneuInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${localPneuInstance.id}">${fieldValue(bean: localPneuInstance, field: "veiculo")}</g:link></td>
					
						<td>${fieldValue(bean: localPneuInstance, field: "pneu")}</td>
					
						<td>${fieldValue(bean: localPneuInstance, field: "posicao")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${localPneuInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
