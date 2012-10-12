package cmf

class StatusServico {
	
	Date inicio
	Date fim
	String status

    static constraints = {
		status inList: ["Em Execução", "Aguardando Peças" , "Aguardando Mão de Obra", "Encerrado"]
    }
}
