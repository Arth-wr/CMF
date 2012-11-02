package cmf

class Servico {
	
	String descricao
        
    String toString(){
        "${descricao}"
    }

    static constraints = {
		descricao blank: false
    }
  
}