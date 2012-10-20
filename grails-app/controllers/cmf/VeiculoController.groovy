package cmf

import org.springframework.dao.DataIntegrityViolationException

class VeiculoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [veiculoInstanceList: Veiculo.list(params), veiculoInstanceTotal: Veiculo.count()]
    }

    def create() {
        [veiculoInstance: new Veiculo(params)]
    }

    def save() {
        def veiculoInstance = new Veiculo(params)
        if (!veiculoInstance.save(flush: true)) {
            render(view: "create", model: [veiculoInstance: veiculoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'veiculo.label', default: 'Veiculo'), veiculoInstance.id])
        redirect(action: "show", id: veiculoInstance.id)
    }

    def show(Long id) {
        def veiculoInstance = Veiculo.get(id)
        if (!veiculoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'veiculo.label', default: 'Veiculo'), id])
            redirect(action: "list")
            return
        }

        [veiculoInstance: veiculoInstance]
    }

    def edit(Long id) {
        def veiculoInstance = Veiculo.get(id)
        if (!veiculoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'veiculo.label', default: 'Veiculo'), id])
            redirect(action: "list")
            return
        }

        [veiculoInstance: veiculoInstance]
    }

    def update(Long id, Long version) {
        def veiculoInstance = Veiculo.get(id)
        if (!veiculoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'veiculo.label', default: 'Veiculo'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (veiculoInstance.version > version) {
                veiculoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'veiculo.label', default: 'Veiculo')] as Object[],
                          "Another user has updated this Veiculo while you were editing")
                render(view: "edit", model: [veiculoInstance: veiculoInstance])
                return
            }
        }

        veiculoInstance.properties = params

        if (!veiculoInstance.save(flush: true)) {
            render(view: "edit", model: [veiculoInstance: veiculoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'veiculo.label', default: 'Veiculo'), veiculoInstance.id])
        redirect(action: "show", id: veiculoInstance.id)
    }

    def delete(Long id) {
        def veiculoInstance = Veiculo.get(id)
        if (!veiculoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'veiculo.label', default: 'Veiculo'), id])
            redirect(action: "list")
            return
        }

        try {
            veiculoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'veiculo.label', default: 'Veiculo'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'veiculo.label', default: 'Veiculo'), id])
            redirect(action: "show", id: id)
        }
    }
}
