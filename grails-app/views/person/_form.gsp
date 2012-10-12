<%@ page import="cmf.Person" %>


<head>
                <resource:autoComplete skin="default" />
	</head>
<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="person.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${personInstance?.name}"/>
        
        <richui:autoComplete name="person" action="${createLinkTo('dir': 'person/searchAJAX')}" />
        
</div>

