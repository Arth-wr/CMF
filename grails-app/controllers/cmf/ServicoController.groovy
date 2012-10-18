package cmf

import grails.converters.JSON;

import org.springframework.dao.DataIntegrityViolationException

class ServicoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    
    def searchAJAX = {
        def services = Servico.findAllByDescricaoLike("%${params.query}%")

        //Create XML response
        render(contentType: "text/xml") {
	    results() {
	        services.each { service ->
		    result(){
		        name(service.descricao)
                        //Optional id which will be available in onItemSelect
                        id(service.id)
		    }
		}
            }
        }
    }
	
	def searchJSON () {
		def services = Servico.findAllfindAllByDescricaoLike("%${params.name_startsWith}%")
		
		def c = Servico.createCriteria();
		
		def results = c { 
			like("descricao", "%${params.name_startsWith}%")
			maxResults(Integer.parseInt( params.maxRows))
		}
		
		render results as JSON;
	}

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [servicoInstanceList: Servico.list(params), servicoInstanceTotal: Servico.count()]
    }

    def create() {
        [servicoInstance: new Servico(params)]
    }

    def save() {
        def servicoInstance = new Servico(params)
        if (!servicoInstance.save(flush: true)) {
            render(view: "create", model: [servicoInstance: servicoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'servico.label', default: 'Servico'), servicoInstance.id])
        redirect(action: "show", id: servicoInstance.id)
    }

    def show(Long id) {
        def servicoInstance = Servico.get(id)
        if (!servicoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'servico.label', default: 'Servico'), id])
            redirect(action: "list")
            return
        }

        [servicoInstance: servicoInstance]
    }

    def edit(Long id) {
        def servicoInstance = Servico.get(id)
        if (!servicoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'servico.label', default: 'Servico'), id])
            redirect(action: "list")
            return
        }

        [servicoInstance: servicoInstance]
    }

    def update(Long id, Long version) {
        def servicoInstance = Servico.get(id)
        if (!servicoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'servico.label', default: 'Servico'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (servicoInstance.version > version) {
                servicoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'servico.label', default: 'Servico')] as Object[],
                          "Another user has updated this Servico while you were editing")
                render(view: "edit", model: [servicoInstance: servicoInstance])
                return
            }
        }

        servicoInstance.properties = params

        if (!servicoInstance.save(flush: true)) {
            render(view: "edit", model: [servicoInstance: servicoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'servico.label', default: 'Servico'), servicoInstance.id])
        redirect(action: "show", id: servicoInstance.id)
    }

    def delete(Long id) {
        def servicoInstance = Servico.get(id)
        if (!servicoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'servico.label', default: 'Servico'), id])
            redirect(action: "list")
            return
        }

        try {
            servicoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'servico.label', default: 'Servico'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'servico.label', default: 'Servico'), id])
            redirect(action: "show", id: id)
        }
    }
}
