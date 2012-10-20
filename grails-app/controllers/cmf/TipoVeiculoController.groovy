package cmf

import org.springframework.dao.DataIntegrityViolationException

class TipoVeiculoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [tipoVeiculoInstanceList: TipoVeiculo.list(params), tipoVeiculoInstanceTotal: TipoVeiculo.count()]
    }

    def create() {
        [tipoVeiculoInstance: new TipoVeiculo(params)]
    }

    def save() {
        def tipoVeiculoInstance = new TipoVeiculo(params)
        if (!tipoVeiculoInstance.save(flush: true)) {
            render(view: "create", model: [tipoVeiculoInstance: tipoVeiculoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'tipoVeiculo.label', default: 'TipoVeiculo'), tipoVeiculoInstance.id])
        redirect(action: "show", id: tipoVeiculoInstance.id)
    }

    def show(Long id) {
        def tipoVeiculoInstance = TipoVeiculo.get(id)
        if (!tipoVeiculoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoVeiculo.label', default: 'TipoVeiculo'), id])
            redirect(action: "list")
            return
        }

        [tipoVeiculoInstance: tipoVeiculoInstance]
    }

    def edit(Long id) {
        def tipoVeiculoInstance = TipoVeiculo.get(id)
        if (!tipoVeiculoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoVeiculo.label', default: 'TipoVeiculo'), id])
            redirect(action: "list")
            return
        }

        [tipoVeiculoInstance: tipoVeiculoInstance]
    }

    def update(Long id, Long version) {
        def tipoVeiculoInstance = TipoVeiculo.get(id)
        if (!tipoVeiculoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoVeiculo.label', default: 'TipoVeiculo'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (tipoVeiculoInstance.version > version) {
                tipoVeiculoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'tipoVeiculo.label', default: 'TipoVeiculo')] as Object[],
                          "Another user has updated this TipoVeiculo while you were editing")
                render(view: "edit", model: [tipoVeiculoInstance: tipoVeiculoInstance])
                return
            }
        }

        tipoVeiculoInstance.properties = params

        if (!tipoVeiculoInstance.save(flush: true)) {
            render(view: "edit", model: [tipoVeiculoInstance: tipoVeiculoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'tipoVeiculo.label', default: 'TipoVeiculo'), tipoVeiculoInstance.id])
        redirect(action: "show", id: tipoVeiculoInstance.id)
    }

    def delete(Long id) {
        def tipoVeiculoInstance = TipoVeiculo.get(id)
        if (!tipoVeiculoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoVeiculo.label', default: 'TipoVeiculo'), id])
            redirect(action: "list")
            return
        }

        try {
            tipoVeiculoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'tipoVeiculo.label', default: 'TipoVeiculo'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'tipoVeiculo.label', default: 'TipoVeiculo'), id])
            redirect(action: "show", id: id)
        }
    }
}
