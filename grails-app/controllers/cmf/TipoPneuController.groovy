package cmf

import org.springframework.dao.DataIntegrityViolationException

class TipoPneuController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [tipoPneuInstanceList: TipoPneu.list(params), tipoPneuInstanceTotal: TipoPneu.count()]
    }

    def create() {
        [tipoPneuInstance: new TipoPneu(params)]
    }

    def save() {
        def tipoPneuInstance = new TipoPneu(params)
        if (!tipoPneuInstance.save(flush: true)) {
            render(view: "create", model: [tipoPneuInstance: tipoPneuInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'tipoPneu.label', default: 'TipoPneu'), tipoPneuInstance.id])
        redirect(action: "show", id: tipoPneuInstance.id)
    }

    def show(Long id) {
        def tipoPneuInstance = TipoPneu.get(id)
        if (!tipoPneuInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoPneu.label', default: 'TipoPneu'), id])
            redirect(action: "list")
            return
        }

        [tipoPneuInstance: tipoPneuInstance]
    }

    def edit(Long id) {
        def tipoPneuInstance = TipoPneu.get(id)
        if (!tipoPneuInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoPneu.label', default: 'TipoPneu'), id])
            redirect(action: "list")
            return
        }

        [tipoPneuInstance: tipoPneuInstance]
    }

    def update(Long id, Long version) {
        def tipoPneuInstance = TipoPneu.get(id)
        if (!tipoPneuInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoPneu.label', default: 'TipoPneu'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (tipoPneuInstance.version > version) {
                tipoPneuInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'tipoPneu.label', default: 'TipoPneu')] as Object[],
                          "Another user has updated this TipoPneu while you were editing")
                render(view: "edit", model: [tipoPneuInstance: tipoPneuInstance])
                return
            }
        }

        tipoPneuInstance.properties = params

        if (!tipoPneuInstance.save(flush: true)) {
            render(view: "edit", model: [tipoPneuInstance: tipoPneuInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'tipoPneu.label', default: 'TipoPneu'), tipoPneuInstance.id])
        redirect(action: "show", id: tipoPneuInstance.id)
    }

    def delete(Long id) {
        def tipoPneuInstance = TipoPneu.get(id)
        if (!tipoPneuInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoPneu.label', default: 'TipoPneu'), id])
            redirect(action: "list")
            return
        }

        try {
            tipoPneuInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'tipoPneu.label', default: 'TipoPneu'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'tipoPneu.label', default: 'TipoPneu'), id])
            redirect(action: "show", id: id)
        }
    }
}
