package cmf

class OrdemServico {
    
    Date entrada
    Date saida
    
    static hasMany = [servicos : Servico]

    static constraints = {
    }
}
