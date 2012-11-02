package cmf

class OrdemServico {
    
    Date entrada
    Date saida
    boolean emAberto
    
    String toString(){
        "${entrada}"
    }
    
    static hasMany = [servicos : Servico, statusServico: StatusServico]

    static constraints = {
        saida blank:true
        saida nullable:true
    }
}
