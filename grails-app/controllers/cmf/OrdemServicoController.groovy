package cmf

import org.springframework.dao.DataIntegrityViolationException

class OrdemServicoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [ordemServicoInstanceList: OrdemServico.list(params), ordemServicoInstanceTotal: OrdemServico.count()]
    }

    def create() {
        [ordemServicoInstance: new OrdemServico(params)]
    }
    
    def insereServico(){
        
       def servico = params.service 
       def listaServicos = Servico.findAllWhere(descricao: servico)
       
     //  def sessao = session["sessao"]
     //  session["sessao"] = listaServicos
   
       render(view: "create", model:[sessao: sessao, servico : servico, listaServicos : listaServicos])
       return       
    }

    def save() {
        def ordemServicoInstance = new OrdemServico(params)
        
        println(params)
             
        if (!ordemServicoInstance.save(flush: true)) {
            render(view: "create", model: [ordemServicoInstance: ordemServicoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'ordemServico.label', default: 'OrdemServico'), ordemServicoInstance.id])
        redirect(action: "show", id: ordemServicoInstance.id)
    }

    def show(Long id) {
        def ordemServicoInstance = OrdemServico.get(id)
        if (!ordemServicoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ordemServico.label', default: 'OrdemServico'), id])
            redirect(action: "list")
            return
        }

        [ordemServicoInstance: ordemServicoInstance]
    }

    def edit(Long id) {
        def ordemServicoInstance = OrdemServico.get(id)
        if (!ordemServicoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ordemServico.label', default: 'OrdemServico'), id])
            redirect(action: "list")
            return
        }

        [ordemServicoInstance: ordemServicoInstance]
    }

    def update(Long id, Long version) {
        def ordemServicoInstance = OrdemServico.get(id)
        if (!ordemServicoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ordemServico.label', default: 'OrdemServico'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (ordemServicoInstance.version > version) {
                ordemServicoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'ordemServico.label', default: 'OrdemServico')] as Object[],
                          "Another user has updated this OrdemServico while you were editing")
                render(view: "edit", model: [ordemServicoInstance: ordemServicoInstance])
                return
            }
        }

        ordemServicoInstance.properties = params

        if (!ordemServicoInstance.save(flush: true)) {
            render(view: "edit", model: [ordemServicoInstance: ordemServicoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'ordemServico.label', default: 'OrdemServico'), ordemServicoInstance.id])
        redirect(action: "show", id: ordemServicoInstance.id)
    }

    def delete(Long id) {
        def ordemServicoInstance = OrdemServico.get(id)
        if (!ordemServicoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ordemServico.label', default: 'OrdemServico'), id])
            redirect(action: "list")
            return
        }

        try {
            ordemServicoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'ordemServico.label', default: 'OrdemServico'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'ordemServico.label', default: 'OrdemServico'), id])
            redirect(action: "show", id: id)
        }
    }
}
