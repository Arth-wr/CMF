package cmf

import org.springframework.dao.DataIntegrityViolationException

class LocalPneuController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [localPneuInstanceList: LocalPneu.list(params), localPneuInstanceTotal: LocalPneu.count()]
    }
    
    def show_1(){
         def localPneuInstance = new LocalPneu(params)
        //[localPneuInstance: new LocalPneu(params)]
       // [params: params]
    }
    
    def pegaPosicao(){
        
       def localPneuInstance = new LocalPneu(params) 
        println(params)  
        println(localPneuInstance.posicao) 
      //  render(view: "create", model: [localPneuInstance: localPneuInstance])
    }

    def create() {
        
        [localPneuInstance: new LocalPneu(params)]
//        def localPneuInstance = new LocalPneu(params)
//        
//        println(params)
//        
//        println(localPneuInstance.posicao)
//        
//         render(view: "create", model: [localPneuInstance: localPneuInstance])    
      // println(params)
    }

    def save() {
        def localPneuInstance = new LocalPneu(params)
        
        println(params)
               
        if (!localPneuInstance.save(flush: true)) {
            render(view: "create", model: [localPneuInstance: localPneuInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'localPneu.label', default: 'LocalPneu'), localPneuInstance.id])
       render(view: "create", model: [localPneuInstance: localPneuInstance])
      //  redirect(action: "create", id: params.veiculo.id)
    }

    def show(Long id) {
        def localPneuInstance = LocalPneu.get(id)
        if (!localPneuInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'localPneu.label', default: 'LocalPneu'), id])
            redirect(action: "list")
            return
        }

        [localPneuInstance: localPneuInstance]
    }

    def edit(Long id) {
        def localPneuInstance = LocalPneu.get(id)
        if (!localPneuInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'localPneu.label', default: 'LocalPneu'), id])
            redirect(action: "list")
            return
        }

        [localPneuInstance: localPneuInstance]
    }

    def update(Long id, Long version) {
        def localPneuInstance = LocalPneu.get(id)
        if (!localPneuInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'localPneu.label', default: 'LocalPneu'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (localPneuInstance.version > version) {
                localPneuInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'localPneu.label', default: 'LocalPneu')] as Object[],
                          "Another user has updated this LocalPneu while you were editing")
                render(view: "edit", model: [localPneuInstance: localPneuInstance])
                return
            }
        }

        localPneuInstance.properties = params

        if (!localPneuInstance.save(flush: true)) {
            render(view: "edit", model: [localPneuInstance: localPneuInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'localPneu.label', default: 'LocalPneu'), localPneuInstance.id])
        redirect(action: "show", id: localPneuInstance.id)
    }

    def delete(Long id) {
        def localPneuInstance = LocalPneu.get(id)
        if (!localPneuInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'localPneu.label', default: 'LocalPneu'), id])
            redirect(action: "list")
            return
        }

        try {
            localPneuInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'localPneu.label', default: 'LocalPneu'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'localPneu.label', default: 'LocalPneu'), id])
            redirect(action: "show", id: id)
        }
    }
}
