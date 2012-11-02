package cmf

class StatusServico {
	
        OrdemServico ordemServico 
	Date inicio
	Date fim
	String status
        
    String toString(){
        "${status}"
    }

    static constraints = {
		status inList: ["Em Execução", "Aguardando Peças" , "Aguardando Mão de Obra", "Encerrado"]
    }
}
