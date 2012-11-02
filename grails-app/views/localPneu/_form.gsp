<%@ page import="cmf.LocalPneu" %>



<div class="fieldcontain ${hasErrors(bean: localPneuInstance, field: 'veiculo', 'error')} required">
	<label for="veiculo">
		<g:message code="localPneu.veiculo.label" default="Veiculo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="veiculo" name="veiculo.id" from="${cmf.Veiculo.list()}" optionKey="id" required="" value="${localPneuInstance?.veiculo?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: localPneuInstance, field: 'pneu', 'error')} required">
	<label for="pneu">
		<g:message code="localPneu.pneu.label" default="Pneu" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="pneu" name="pneu.id" from="${cmf.Pneu.list()}" optionKey="id" required="" value="${localPneuInstance?.pneu?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: localPneuInstance, field: 'posicao', 'error')} required">
	<label for="posicao">
		<g:message code="localPneu.posicao.label" default="Posicao" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField id="pos" name="posicao" required="" value="${localPneuInstance?.posicao}"/>
</div>


   <a id="lightbox" class="fancybox" title="">
	<img src="" alt="" /> Ver Legenda
   </a>

<script> 
  $("#lightbox").click(function() {
           //   window.open("http://localhost:8080/CMF/localPneu/show_1", "Janela tesste", "width=600, height=500");
				$.fancybox.open({
					href : 'show_1',
					type : 'iframe',
                                        closeClick : true,
					padding : 10
                                        
                 //   $("#fancybox-manual-a").click(function() {
		//    $.fancybox.open('C:/Users/Arthur/Documents/GitHub/CMF/web-app/images/eixos.png');
                                });        
				});			
  </script>

