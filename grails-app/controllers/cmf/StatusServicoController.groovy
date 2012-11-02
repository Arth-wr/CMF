package cmf

import org.springframework.dao.DataIntegrityViolationException

class StatusServicoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [statusServicoInstanceList: StatusServico.list(params), statusServicoInstanceTotal: StatusServico.count()]
    }

    def create() {
        [statusServicoInstance: new StatusServico(params)]
    }

    def save() {
        def statusServicoInstance = new StatusServico(params)
        if (!statusServicoInstance.save(flush: true)) {
            render(view: "create", model: [statusServicoInstance: statusServicoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'statusServico.label', default: 'StatusServico'), statusServicoInstance.id])
        redirect(action: "show", id: statusServicoInstance.id)
    }

    def show(Long id) {
        def statusServicoInstance = StatusServico.get(id)
        if (!statusServicoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'statusServico.label', default: 'StatusServico'), id])
            redirect(action: "list")
            return
        }

        [statusServicoInstance: statusServicoInstance]
    }

    def edit(Long id) {
        def statusServicoInstance = StatusServico.get(id)
        if (!statusServicoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'statusServico.label', default: 'StatusServico'), id])
            redirect(action: "list")
            return
        }

        [statusServicoInstance: statusServicoInstance]
    }

    def update(Long id, Long version) {
        def statusServicoInstance = StatusServico.get(id)
        if (!statusServicoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'statusServico.label', default: 'StatusServico'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (statusServicoInstance.version > version) {
                statusServicoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'statusServico.label', default: 'StatusServico')] as Object[],
                          "Another user has updated this StatusServico while you were editing")
                render(view: "edit", model: [statusServicoInstance: statusServicoInstance])
                return
            }
        }

        statusServicoInstance.properties = params

        if (!statusServicoInstance.save(flush: true)) {
            render(view: "edit", model: [statusServicoInstance: statusServicoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'statusServico.label', default: 'StatusServico'), statusServicoInstance.id])
        redirect(action: "show", id: statusServicoInstance.id)
    }

    def delete(Long id) {
        def statusServicoInstance = StatusServico.get(id)
        if (!statusServicoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'statusServico.label', default: 'StatusServico'), id])
            redirect(action: "list")
            return
        }

        try {
            statusServicoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'statusServico.label', default: 'StatusServico'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'statusServico.label', default: 'StatusServico'), id])
            redirect(action: "show", id: id)
        }
    }
}
