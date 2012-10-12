package cmf

class TipoVeiculo {
	
	String descricao
	int numEixos
	
	String toString() {
		"${descricao}"
	}

    static constraints = {
		numEixos blank: false
		descricao blank: false
    }
}
