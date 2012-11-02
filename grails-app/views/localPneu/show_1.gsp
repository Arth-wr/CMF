
<%@ page import="cmf.LocalPneu" %>
<!DOCTYPE html>
<html>
  <head>
      <meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'localPneu.label', default: 'LocalPneu')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
                 <r:require module="fancybox"/> 
  </head>
  <body>
    
    <g:form action="pegaPosicao">       
<table>
  <tr>
    <th width="174"></th>
    <th width="273"><a href="/CMF/localPneu/create/1" align="center" class="edit">
      <input type="radio" name="posicao" value="1" id="RadioGroup1_1" />
      <img src="/CMF/static/images/pneu-02.jpg" width="200" height="150" /></a>
    </th>
          <th width="274"><a href="/CMF/localPneu/pegaPosicao/2" align="center" class="edit">
          <input type="radio" name="posicao" value="2" id="RadioGroup1_0" />
          <img src="/CMF/static/images/pneu-02.jpg" width="200" height="150" /></a>
          </th>
           <th width="197"></th>
          </tr>
         
      </table>
             
          <div id="posicao">
          </div>
          <fieldset class="buttons">
                <g:submitButton id="teste" name="ok" class="save" value="OK" onClick="history.go(0)"/>
	  </fieldset>
        </g:form>
        
<script>
   $('#teste').click(function(){
        parent.$.fancybox.close();
  //       alert($('#RadioGroup1_1').val());                       
   //    window.opener.document.getElementById('pos').value = $('#RadioGroup1_1').val();
     //   window.returnValue = $('#RadioGroup1_1').val()
                        });
</script>
     
	</body>
        

   
</html>
