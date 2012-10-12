package cmf

class TipoPneu {
	
	String bitola
	String desenho
	
	String toString() {
		"${bitola} - ${desenho}"
	}

    static constraints = {
		bitola blank: false
		desenho blank: false
    }
}
