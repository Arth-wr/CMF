package cmf

class Veiculo {
	
	String modelo
	String marca
	String cor
	String placa
	String chassi
	TipoVeiculo tipoVeiculo

    static constraints = {
		chassi unique: true
		placa unique: true
		tipoVeiculo blank: false
		chassi blank: false
		placa blank: false
    }
}
