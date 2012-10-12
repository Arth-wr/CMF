package cmf



import org.junit.*
import grails.test.mixin.*

@TestFor(OrdemServicoController)
@Mock(OrdemServico)
class OrdemServicoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/ordemServico/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.ordemServicoInstanceList.size() == 0
        assert model.ordemServicoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.ordemServicoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.ordemServicoInstance != null
        assert view == '/ordemServico/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/ordemServico/show/1'
        assert controller.flash.message != null
        assert OrdemServico.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/ordemServico/list'

        populateValidParams(params)
        def ordemServico = new OrdemServico(params)

        assert ordemServico.save() != null

        params.id = ordemServico.id

        def model = controller.show()

        assert model.ordemServicoInstance == ordemServico
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/ordemServico/list'

        populateValidParams(params)
        def ordemServico = new OrdemServico(params)

        assert ordemServico.save() != null

        params.id = ordemServico.id

        def model = controller.edit()

        assert model.ordemServicoInstance == ordemServico
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/ordemServico/list'

        response.reset()

        populateValidParams(params)
        def ordemServico = new OrdemServico(params)

        assert ordemServico.save() != null

        // test invalid parameters in update
        params.id = ordemServico.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/ordemServico/edit"
        assert model.ordemServicoInstance != null

        ordemServico.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/ordemServico/show/$ordemServico.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        ordemServico.clearErrors()

        populateValidParams(params)
        params.id = ordemServico.id
        params.version = -1
        controller.update()

        assert view == "/ordemServico/edit"
        assert model.ordemServicoInstance != null
        assert model.ordemServicoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/ordemServico/list'

        response.reset()

        populateValidParams(params)
        def ordemServico = new OrdemServico(params)

        assert ordemServico.save() != null
        assert OrdemServico.count() == 1

        params.id = ordemServico.id

        controller.delete()

        assert OrdemServico.count() == 0
        assert OrdemServico.get(ordemServico.id) == null
        assert response.redirectedUrl == '/ordemServico/list'
    }
}
