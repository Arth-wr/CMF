package cmf

class StatusServico {
	
	Date inicio
	Date fim
	String status

    static constraints = {
		status inList: ["Em Execu��o", "Aguardando Pe�as" , "Aguardando M�o de Obra", "Encerrado"]
    }
}
