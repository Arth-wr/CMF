package cmf

class Servico {
	
	String descricao
        boolean selecionado = false

    static constraints = {
		descricao blank: false
    }
    
    static transients = ['selecionado']
}