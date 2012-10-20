package cmf



import org.junit.*
import grails.test.mixin.*

@TestFor(VeiculoController)
@Mock(Veiculo)
class VeiculoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/veiculo/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.veiculoInstanceList.size() == 0
        assert model.veiculoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.veiculoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.veiculoInstance != null
        assert view == '/veiculo/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/veiculo/show/1'
        assert controller.flash.message != null
        assert Veiculo.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/veiculo/list'

        populateValidParams(params)
        def veiculo = new Veiculo(params)

        assert veiculo.save() != null

        params.id = veiculo.id

        def model = controller.show()

        assert model.veiculoInstance == veiculo
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/veiculo/list'

        populateValidParams(params)
        def veiculo = new Veiculo(params)

        assert veiculo.save() != null

        params.id = veiculo.id

        def model = controller.edit()

        assert model.veiculoInstance == veiculo
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/veiculo/list'

        response.reset()

        populateValidParams(params)
        def veiculo = new Veiculo(params)

        assert veiculo.save() != null

        // test invalid parameters in update
        params.id = veiculo.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/veiculo/edit"
        assert model.veiculoInstance != null

        veiculo.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/veiculo/show/$veiculo.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        veiculo.clearErrors()

        populateValidParams(params)
        params.id = veiculo.id
        params.version = -1
        controller.update()

        assert view == "/veiculo/edit"
        assert model.veiculoInstance != null
        assert model.veiculoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/veiculo/list'

        response.reset()

        populateValidParams(params)
        def veiculo = new Veiculo(params)

        assert veiculo.save() != null
        assert Veiculo.count() == 1

        params.id = veiculo.id

        controller.delete()

        assert Veiculo.count() == 0
        assert Veiculo.get(veiculo.id) == null
        assert response.redirectedUrl == '/veiculo/list'
    }
}
