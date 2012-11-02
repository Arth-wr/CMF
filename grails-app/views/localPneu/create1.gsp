<%@ page import="cmf.LocalPneu" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'localPneu.label', default: 'LocalPneu')}" />
  <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>
  <a href="#create-localPneu" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
  <div class="nav" role="navigation">
    <ul>
      <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
      <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
    </ul>
  </div>
  <div id="create-localPneu" class="content scaffold-create" role="main">
    <h1><g:message code="default.create.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
      <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${localPneuInstance}">
      <ul class="errors" role="alert">
        <g:eachError bean="${localPneuInstance}" var="error">
          <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
      </ul>
    </g:hasErrors>


    <table> 
      <tr><g:render template="form_1"/></tr>
      <tr>
        <th>
      <g:form action="save" >
        <fieldset class="form">
          <input type="hidden" name="veiculo.id" value="${params.id}"/>
          <div class="fieldcontain ${hasErrors(bean: localPneuInstance, field: 'pneu', 'error')} required">
           <div style="float: left">
            <label for="pneu">
              <g:message code="localPneu.pneu.label" default="Pneu" />
  
            </label>
            
            <g:select id="pneu" name="pneu.id" from="${cmf.Pneu.list()}" optionKey="id" required="" value="${localPneuInstance?.pneu?.id}" class="many-to-one"/>
            </div>
            <div style="height: 20px; width: 50px" class="buttons">
          <g:submitButton name="create" class="save" value="Salvar" />
        </div>
          </div>

          <div class="fieldcontain ${hasErrors(bean: localPneuInstance, field: 'posicao', 'error')} required">
            <input type="hidden" name="posicao" required="" value="1"/>
          </div>



          <!--  <g:render template="form"/> -->
        </fieldset>
        
      </g:form>
      </th> 
      <th>
      <g:img dir="images" file="pneu-02.jpg" width="100" height="100"/>
      </th>
      <th>
      <g:img dir="images" file="pneu-02.jpg" width="100" height="100"/>
      </th>
      <th>
      <g:form action="save" >
        <fieldset class="form">



          <input type="hidden" name="veiculo.id" value="${params.id}"/>

          <div class="fieldcontain ${hasErrors(bean: localPneuInstance, field: 'pneu', 'error')} required">
            <label for="pneu">
              <g:message code="localPneu.pneu.label" default="Pneu" />
              <span class="required-indicator">*</span>
            </label>
            <g:select id="pneu" name="pneu.id" from="${cmf.Pneu.list()}" optionKey="id" required="" value="${localPneuInstance?.pneu?.id}" class="many-to-one"/>
          </div>

          <div class="fieldcontain ${hasErrors(bean: localPneuInstance, field: 'posicao', 'error')} required">                             
            <input type="hidden" name="posicao" required="" value="2"/>
          </div>

          <!--  <g:render template="form"/> -->
        </fieldset>
        <fieldset class="buttons">
          <g:submitButton name="create" class="save" value="Salvar" />
        </fieldset>
      </g:form>
      </th> 


      </tr>
      
   <!--   <tr><th></th><th></th><th><br><br><br><br><br></th><th></th></tr> -->

      <tr>
        <th>
      <g:form action="save" >
        <fieldset class="form">
          <input type="hidden" name="veiculo.id" value="${params.id}"/>
          <div class="fieldcontain ${hasErrors(bean: localPneuInstance, field: 'pneu', 'error')} required">
            <label for="pneu">
              <g:message code="localPneu.pneu.label" default="Pneu" />
              <span class="required-indicator">*</span>
            </label>
            <g:select id="pneu" name="pneu.id" from="${cmf.Pneu.list()}" optionKey="id" required="" value="${localPneuInstance?.pneu?.id}" class="many-to-one"/>
          </div>

          <div class="fieldcontain ${hasErrors(bean: localPneuInstance, field: 'posicao', 'error')} required">
            <input type="hidden" name="posicao" required="" value="1"/>
          </div>



          <!--  <g:render template="form"/> -->
        </fieldset>
        <fieldset class="buttons">
          <g:submitButton name="create" class="save" value="Salvar" />
        </fieldset>
      </g:form>
      </th> 
      <th>
      <g:img dir="images" file="pneu-02.jpg" width="100" height="100"/>
      </th>
      <th>
      <g:img dir="images" file="pneu-02.jpg" width="100" height="100"/>
      </th>
      <th>
      <g:form action="save" >
        <fieldset class="form">



          <input type="hidden" name="veiculo.id" value="${params.id}"/>

          <div class="fieldcontain ${hasErrors(bean: localPneuInstance, field: 'pneu', 'error')} required">
            <label for="pneu">
              <g:message code="localPneu.pneu.label" default="Pneu" />
              <span class="required-indicator">*</span>
            </label>
            <g:select id="pneu" name="pneu.id" from="${cmf.Pneu.list()}" optionKey="id" required="" value="${localPneuInstance?.pneu?.id}" class="many-to-one"/>
          </div>

          <div class="fieldcontain ${hasErrors(bean: localPneuInstance, field: 'posicao', 'error')} required">                             
            <input type="hidden" name="posicao" required="" value="2"/>
          </div>

          <!--  <g:render template="form"/> -->
        </fieldset>
        <fieldset class="buttons">
          <g:submitButton name="create" class="save" value="Salvar" />
        </fieldset>
      </g:form>
      </th> 


      </tr>
      
       <tr>
        <th>
      <g:form action="save" >
        <fieldset class="form">
          <input type="hidden" name="veiculo.id" value="${params.id}"/>
          <div class="fieldcontain ${hasErrors(bean: localPneuInstance, field: 'pneu', 'error')} required">
            <label for="pneu">
              <g:message code="localPneu.pneu.label" default="Pneu" />
              <span class="required-indicator">*</span>
            </label>
            <g:select id="pneu" name="pneu.id" from="${cmf.Pneu.list()}" optionKey="id" required="" value="${localPneuInstance?.pneu?.id}" class="many-to-one"/>
          </div>

          <div class="fieldcontain ${hasErrors(bean: localPneuInstance, field: 'posicao', 'error')} required">
            <input type="hidden" name="posicao" required="" value="1"/>
          </div>



          <!--  <g:render template="form"/> -->
        </fieldset>
        <fieldset class="buttons">
          <g:submitButton name="create" class="save" value="Salvar" />
        </fieldset>
      </g:form>
      </th> 
      <th>
      <g:img dir="images" file="pneu-02.jpg" width="100" height="100"/>
      </th>
      <th>
      <g:img dir="images" file="pneu-02.jpg" width="100" height="100"/>
      </th>
      <th>
      <g:form action="save" >
        <fieldset class="form">



          <input type="hidden" name="veiculo.id" value="${params.id}"/>

          <div class="fieldcontain ${hasErrors(bean: localPneuInstance, field: 'pneu', 'error')} required">
            <label for="pneu">
              <g:message code="localPneu.pneu.label" default="Pneu" />
              <span class="required-indicator">*</span>
            </label>
            <g:select id="pneu" name="pneu.id" from="${cmf.Pneu.list()}" optionKey="id" required="" value="${localPneuInstance?.pneu?.id}" class="many-to-one"/>
          </div>

          <div class="fieldcontain ${hasErrors(bean: localPneuInstance, field: 'posicao', 'error')} required">                             
            <input type="hidden" name="posicao" required="" value="2"/>
          </div>

          <!--  <g:render template="form"/> -->
        </fieldset>
        <fieldset class="buttons">
          <g:submitButton name="create" class="save" value="Salvar" />
        </fieldset>
      </g:form>
      </th> 


      </tr>
      
       <tr>
        <th>
      <g:form action="save" >
        <fieldset class="form">
          <input type="hidden" name="veiculo.id" value="${params.id}"/>
          <div class="fieldcontain ${hasErrors(bean: localPneuInstance, field: 'pneu', 'error')} required">
            <label for="pneu">
              <g:message code="localPneu.pneu.label" default="Pneu" />
              <span class="required-indicator">*</span>
            </label>
            <g:select id="pneu" name="pneu.id" from="${cmf.Pneu.list()}" optionKey="id" required="" value="${localPneuInstance?.pneu?.id}" class="many-to-one"/>
          </div>

          <div class="fieldcontain ${hasErrors(bean: localPneuInstance, field: 'posicao', 'error')} required">
            <input type="hidden" name="posicao" required="" value="1"/>
          </div>



          <!--  <g:render template="form"/> -->
        </fieldset>
        <fieldset class="buttons">
          <g:submitButton name="create" class="save" value="Salvar" />
        </fieldset>
      </g:form>
      </th> 
      <th>
      <g:img dir="images" file="pneu-02.jpg" width="100" height="100"/>
      </th>
      <th>
      <g:img dir="images" file="pneu-02.jpg" width="100" height="100"/>
      </th>
      <th>
      <g:form action="save" >
        <fieldset class="form">



          <input type="hidden" name="veiculo.id" value="${params.id}"/>

          <div class="fieldcontain ${hasErrors(bean: localPneuInstance, field: 'pneu', 'error')} required">
            <label for="pneu">
              <g:message code="localPneu.pneu.label" default="Pneu" />
              <span class="required-indicator">*</span>
            </label>
            <g:select id="pneu" name="pneu.id" from="${cmf.Pneu.list()}" optionKey="id" required="" value="${localPneuInstance?.pneu?.id}" class="many-to-one"/>
          </div>

          <div class="fieldcontain ${hasErrors(bean: localPneuInstance, field: 'posicao', 'error')} required">                             
            <input type="hidden" name="posicao" required="" value="2"/>
          </div>

          <!--  <g:render template="form"/> -->
        </fieldset>
        <fieldset class="buttons">
          <g:submitButton name="create" class="save" value="Salvar" />
        </fieldset>
      </g:form>
      </th> 


      </tr>
      
     





    </table> 
  </div>
</body>
</html>
