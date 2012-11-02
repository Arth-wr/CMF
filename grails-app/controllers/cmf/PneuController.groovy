package cmf

import org.springframework.dao.DataIntegrityViolationException

class PneuController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [pneuInstanceList: Pneu.list(params), pneuInstanceTotal: Pneu.count()]
    }

    def create() {
        [pneuInstance: new Pneu(params)]
    }

    def save() {
        def pneuInstance = new Pneu(params)
        if (!pneuInstance.save(flush: true)) {
            render(view: "create", model: [pneuInstance: pneuInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'pneu.label', default: 'Pneu'), pneuInstance.id])
        redirect(action: "show", id: pneuInstance.id)
    }

    def show(Long id) {
        def pneuInstance = Pneu.get(id)
        if (!pneuInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pneu.label', default: 'Pneu'), id])
            redirect(action: "list")
            return
        }

        [pneuInstance: pneuInstance]
    }

    def edit(Long id) {
        def pneuInstance = Pneu.get(id)
        if (!pneuInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pneu.label', default: 'Pneu'), id])
            redirect(action: "list")
            return
        }

        [pneuInstance: pneuInstance]
    }

    def update(Long id, Long version) {
        def pneuInstance = Pneu.get(id)
        if (!pneuInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pneu.label', default: 'Pneu'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (pneuInstance.version > version) {
                pneuInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'pneu.label', default: 'Pneu')] as Object[],
                          "Another user has updated this Pneu while you were editing")
                render(view: "edit", model: [pneuInstance: pneuInstance])
                return
            }
        }

        pneuInstance.properties = params

        if (!pneuInstance.save(flush: true)) {
            render(view: "edit", model: [pneuInstance: pneuInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'pneu.label', default: 'Pneu'), pneuInstance.id])
        redirect(action: "show", id: pneuInstance.id)
    }

    def delete(Long id) {
        def pneuInstance = Pneu.get(id)
        if (!pneuInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pneu.label', default: 'Pneu'), id])
            redirect(action: "list")
            return
        }

        try {
            pneuInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'pneu.label', default: 'Pneu'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'pneu.label', default: 'Pneu'), id])
            redirect(action: "show", id: id)
        }
    }
}
