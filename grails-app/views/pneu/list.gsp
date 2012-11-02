
<%@ page import="cmf.Pneu" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pneu.label', default: 'Pneu')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-pneu" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-pneu" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="pneu.tipoPneu.label" default="Tipo Pneu" /></th>
					
						<g:sortableColumn property="preco" title="${message(code: 'pneu.preco.label', default: 'Preco')}" />
					
						<g:sortableColumn property="dot" title="${message(code: 'pneu.dot.label', default: 'Dot')}" />
					
						<g:sortableColumn property="fogo" title="${message(code: 'pneu.fogo.label', default: 'Fogo')}" />
					
						<g:sortableColumn property="marca" title="${message(code: 'pneu.marca.label', default: 'Marca')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${pneuInstanceList}" status="i" var="pneuInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${pneuInstance.id}">${fieldValue(bean: pneuInstance, field: "tipoPneu")}</g:link></td>
					
						<td>${fieldValue(bean: pneuInstance, field: "preco")}</td>
					
						<td>${fieldValue(bean: pneuInstance, field: "dot")}</td>
					
						<td>${fieldValue(bean: pneuInstance, field: "fogo")}</td>
					
						<td>${fieldValue(bean: pneuInstance, field: "marca")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${pneuInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
