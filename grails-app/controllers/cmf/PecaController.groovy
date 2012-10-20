package cmf

import org.springframework.dao.DataIntegrityViolationException

class PecaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [pecaInstanceList: Peca.list(params), pecaInstanceTotal: Peca.count()]
    }

    def create() {
        [pecaInstance: new Peca(params)]
    }

    def save() {
        def pecaInstance = new Peca(params)
        if (!pecaInstance.save(flush: true)) {
            render(view: "create", model: [pecaInstance: pecaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'peca.label', default: 'Peca'), pecaInstance.id])
        redirect(action: "show", id: pecaInstance.id)
    }

    def show(Long id) {
        def pecaInstance = Peca.get(id)
        if (!pecaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'peca.label', default: 'Peca'), id])
            redirect(action: "list")
            return
        }

        [pecaInstance: pecaInstance]
    }

    def edit(Long id) {
        def pecaInstance = Peca.get(id)
        if (!pecaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'peca.label', default: 'Peca'), id])
            redirect(action: "list")
            return
        }

        [pecaInstance: pecaInstance]
    }

    def update(Long id, Long version) {
        def pecaInstance = Peca.get(id)
        if (!pecaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'peca.label', default: 'Peca'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (pecaInstance.version > version) {
                pecaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'peca.label', default: 'Peca')] as Object[],
                          "Another user has updated this Peca while you were editing")
                render(view: "edit", model: [pecaInstance: pecaInstance])
                return
            }
        }

        pecaInstance.properties = params

        if (!pecaInstance.save(flush: true)) {
            render(view: "edit", model: [pecaInstance: pecaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'peca.label', default: 'Peca'), pecaInstance.id])
        redirect(action: "show", id: pecaInstance.id)
    }

    def delete(Long id) {
        def pecaInstance = Peca.get(id)
        if (!pecaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'peca.label', default: 'Peca'), id])
            redirect(action: "list")
            return
        }

        try {
            pecaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'peca.label', default: 'Peca'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'peca.label', default: 'Peca'), id])
            redirect(action: "show", id: id)
        }
    }
}
