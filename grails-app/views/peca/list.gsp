
<%@ page import="cmf.Peca" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'peca.label', default: 'Peca')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-peca" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-peca" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="referencia" title="${message(code: 'peca.referencia.label', default: 'Referencia')}" />
					
						<g:sortableColumn property="nome" title="${message(code: 'peca.nome.label', default: 'Nome')}" />
					
						<g:sortableColumn property="localizacao" title="${message(code: 'peca.localizacao.label', default: 'Localizacao')}" />
					
						<g:sortableColumn property="marca" title="${message(code: 'peca.marca.label', default: 'Marca')}" />
					
						<g:sortableColumn property="quantidade" title="${message(code: 'peca.quantidade.label', default: 'Quantidade')}" />
					
						<g:sortableColumn property="quantidadeMinima" title="${message(code: 'peca.quantidadeMinima.label', default: 'Quantidade Minima')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${pecaInstanceList}" status="i" var="pecaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${pecaInstance.id}">${fieldValue(bean: pecaInstance, field: "referencia")}</g:link></td>
					
						<td>${fieldValue(bean: pecaInstance, field: "nome")}</td>
					
						<td>${fieldValue(bean: pecaInstance, field: "localizacao")}</td>
					
						<td>${fieldValue(bean: pecaInstance, field: "marca")}</td>
					
						<td>${fieldValue(bean: pecaInstance, field: "quantidade")}</td>
					
						<td>${fieldValue(bean: pecaInstance, field: "quantidadeMinima")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${pecaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
