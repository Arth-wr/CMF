
<%@ page import="cmf.OrdemServico" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ordemServico.label', default: 'OrdemServico')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-ordemServico" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-ordemServico" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="entrada" title="${message(code: 'ordemServico.entrada.label', default: 'Entrada')}" />
					
						<g:sortableColumn property="saida" title="${message(code: 'ordemServico.saida.label', default: 'Saida')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${ordemServicoInstanceList}" status="i" var="ordemServicoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${ordemServicoInstance.id}">${fieldValue(bean: ordemServicoInstance, field: "entrada")}</g:link></td>
					
						<td><g:formatDate date="${ordemServicoInstance.saida}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${ordemServicoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
