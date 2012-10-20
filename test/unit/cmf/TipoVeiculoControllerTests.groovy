package cmf



import org.junit.*
import grails.test.mixin.*

@TestFor(TipoVeiculoController)
@Mock(TipoVeiculo)
class TipoVeiculoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/tipoVeiculo/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.tipoVeiculoInstanceList.size() == 0
        assert model.tipoVeiculoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.tipoVeiculoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.tipoVeiculoInstance != null
        assert view == '/tipoVeiculo/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/tipoVeiculo/show/1'
        assert controller.flash.message != null
        assert TipoVeiculo.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoVeiculo/list'

        populateValidParams(params)
        def tipoVeiculo = new TipoVeiculo(params)

        assert tipoVeiculo.save() != null

        params.id = tipoVeiculo.id

        def model = controller.show()

        assert model.tipoVeiculoInstance == tipoVeiculo
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoVeiculo/list'

        populateValidParams(params)
        def tipoVeiculo = new TipoVeiculo(params)

        assert tipoVeiculo.save() != null

        params.id = tipoVeiculo.id

        def model = controller.edit()

        assert model.tipoVeiculoInstance == tipoVeiculo
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoVeiculo/list'

        response.reset()

        populateValidParams(params)
        def tipoVeiculo = new TipoVeiculo(params)

        assert tipoVeiculo.save() != null

        // test invalid parameters in update
        params.id = tipoVeiculo.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/tipoVeiculo/edit"
        assert model.tipoVeiculoInstance != null

        tipoVeiculo.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/tipoVeiculo/show/$tipoVeiculo.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        tipoVeiculo.clearErrors()

        populateValidParams(params)
        params.id = tipoVeiculo.id
        params.version = -1
        controller.update()

        assert view == "/tipoVeiculo/edit"
        assert model.tipoVeiculoInstance != null
        assert model.tipoVeiculoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/tipoVeiculo/list'

        response.reset()

        populateValidParams(params)
        def tipoVeiculo = new TipoVeiculo(params)

        assert tipoVeiculo.save() != null
        assert TipoVeiculo.count() == 1

        params.id = tipoVeiculo.id

        controller.delete()

        assert TipoVeiculo.count() == 0
        assert TipoVeiculo.get(tipoVeiculo.id) == null
        assert response.redirectedUrl == '/tipoVeiculo/list'
    }
}
