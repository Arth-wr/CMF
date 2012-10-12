package cmf

class Peca {
	
	String nome
	String referencia
	String referencia2
	String marca
	float valorCompra
	String localizacao
	int quantidadeMinima
	int quantidade
	
	String toString() {
			"${nome} - ${referencia} - ${referencia2}"
		}

    static constraints = {
		referencia unique: true
		referencia2 unique: true
		nome blank: false
		
    }
}
