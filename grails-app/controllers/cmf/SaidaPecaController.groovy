package cmf

import org.springframework.dao.DataIntegrityViolationException

class SaidaPecaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [saidaPecaInstanceList: SaidaPeca.list(params), saidaPecaInstanceTotal: SaidaPeca.count()]
    }

    def create() {
        [saidaPecaInstance: new SaidaPeca(params)]
    }

    def save() {
        def saidaPecaInstance = new SaidaPeca(params)
        if (!saidaPecaInstance.save(flush: true)) {
            render(view: "create", model: [saidaPecaInstance: saidaPecaInstance])
            return
        }
        
        saidaPecaInstance.peca.quantidade -= saidaPecaInstance.quantidade

        flash.message = message(code: 'default.created.message', args: [message(code: 'saidaPeca.label', default: 'SaidaPeca'), saidaPecaInstance.id])
        redirect(action: "show", id: saidaPecaInstance.id)
    }

    def show(Long id) {
        def saidaPecaInstance = SaidaPeca.get(id)
        if (!saidaPecaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'saidaPeca.label', default: 'SaidaPeca'), id])
            redirect(action: "list")
            return
        }

        [saidaPecaInstance: saidaPecaInstance]
    }

    def edit(Long id) {
        def saidaPecaInstance = SaidaPeca.get(id)
        if (!saidaPecaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'saidaPeca.label', default: 'SaidaPeca'), id])
            redirect(action: "list")
            return
        }

        [saidaPecaInstance: saidaPecaInstance]
    }

    def update(Long id, Long version) {
        def saidaPecaInstance = SaidaPeca.get(id)
        if (!saidaPecaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'saidaPeca.label', default: 'SaidaPeca'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (saidaPecaInstance.version > version) {
                saidaPecaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'saidaPeca.label', default: 'SaidaPeca')] as Object[],
                          "Another user has updated this SaidaPeca while you were editing")
                render(view: "edit", model: [saidaPecaInstance: saidaPecaInstance])
                return
            }
        }

        saidaPecaInstance.properties = params

        if (!saidaPecaInstance.save(flush: true)) {
            render(view: "edit", model: [saidaPecaInstance: saidaPecaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'saidaPeca.label', default: 'SaidaPeca'), saidaPecaInstance.id])
        redirect(action: "show", id: saidaPecaInstance.id)
    }

    def delete(Long id) {
        def saidaPecaInstance = SaidaPeca.get(id)
        if (!saidaPecaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'saidaPeca.label', default: 'SaidaPeca'), id])
            redirect(action: "list")
            return
        }

        try {
            saidaPecaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'saidaPeca.label', default: 'SaidaPeca'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'saidaPeca.label', default: 'SaidaPeca'), id])
            redirect(action: "show", id: id)
        }
    }
}
