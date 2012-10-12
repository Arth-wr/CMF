package cmf

class LocalPneu {
	
	Veiculo veiculo
	Pneu pneu
	String posicao

    static constraints = {
		veiculo blank: false
		pneu blank: false
		posicao blank: false
    }
}
