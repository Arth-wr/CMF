package cmf

class Peca {
	
	String nome
	String referencia
	String referenciaTecnica
	String marca
	float valorCompra
	String localizacao
	int quantidadeMinima
	int quantidade
	
	String toString() {
			"${nome} - ${referencia}"
		}

    static constraints = {
		referencia unique: true
		nome blank: false
		
    }
}
