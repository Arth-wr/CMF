
<%@ page import="cmf.SaidaPeca" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'saidaPeca.label', default: 'SaidaPeca')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-saidaPeca" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-saidaPeca" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="data" title="${message(code: 'saidaPeca.data.label', default: 'Data')}" />
					
						<th><g:message code="saidaPeca.peca.label" default="Peca" /></th>
					
						<g:sortableColumn property="quantidade" title="${message(code: 'saidaPeca.quantidade.label', default: 'Quantidade')}" />
					
						<th><g:message code="saidaPeca.veiculo.label" default="Veiculo" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${saidaPecaInstanceList}" status="i" var="saidaPecaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${saidaPecaInstance.id}">${fieldValue(bean: saidaPecaInstance, field: "data")}</g:link></td>
					
						<td>${fieldValue(bean: saidaPecaInstance, field: "peca")}</td>
					
						<td>${fieldValue(bean: saidaPecaInstance, field: "quantidade")}</td>
					
						<td>${fieldValue(bean: saidaPecaInstance, field: "veiculo")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${saidaPecaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
