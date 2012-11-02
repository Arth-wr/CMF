
<%@ page import="cmf.TipoPneu" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tipoPneu.label', default: 'TipoPneu')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-tipoPneu" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-tipoPneu" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="bitola" title="${message(code: 'tipoPneu.bitola.label', default: 'Bitola')}" />
					
						<g:sortableColumn property="desenho" title="${message(code: 'tipoPneu.desenho.label', default: 'Desenho')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${tipoPneuInstanceList}" status="i" var="tipoPneuInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${tipoPneuInstance.id}">${fieldValue(bean: tipoPneuInstance, field: "bitola")}</g:link></td>
					
						<td>${fieldValue(bean: tipoPneuInstance, field: "desenho")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${tipoPneuInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
