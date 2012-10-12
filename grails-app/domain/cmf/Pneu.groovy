package cmf

class Pneu {
	
	String marca
	String dot
	String fogo
	TipoPneu tipoPneu
	String preco	

    static constraints = {
		
		tipoPneu blank: false
		preco blank: false
		dot blank: false
		
    }
}
