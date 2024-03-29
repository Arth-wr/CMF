package cmf

class Veiculo {
	
	String modelo
	String marca
	String cor
	String placa
	String chassi
	TipoVeiculo tipoVeiculo
        
    String toString(){
        "${marca} ${modelo} ${placa}"
    }

    static constraints = {
		chassi unique: true
		placa unique: true
		tipoVeiculo blank: false
		chassi blank: false
		placa blank: false
    }
}
