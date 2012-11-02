package cmf



import org.junit.*
import grails.test.mixin.*

@TestFor(StatusServicoController)
@Mock(StatusServico)
class StatusServicoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/statusServico/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.statusServicoInstanceList.size() == 0
        assert model.statusServicoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.statusServicoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.statusServicoInstance != null
        assert view == '/statusServico/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/statusServico/show/1'
        assert controller.flash.message != null
        assert StatusServico.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/statusServico/list'

        populateValidParams(params)
        def statusServico = new StatusServico(params)

        assert statusServico.save() != null

        params.id = statusServico.id

        def model = controller.show()

        assert model.statusServicoInstance == statusServico
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/statusServico/list'

        populateValidParams(params)
        def statusServico = new StatusServico(params)

        assert statusServico.save() != null

        params.id = statusServico.id

        def model = controller.edit()

        assert model.statusServicoInstance == statusServico
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/statusServico/list'

        response.reset()

        populateValidParams(params)
        def statusServico = new StatusServico(params)

        assert statusServico.save() != null

        // test invalid parameters in update
        params.id = statusServico.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/statusServico/edit"
        assert model.statusServicoInstance != null

        statusServico.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/statusServico/show/$statusServico.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        statusServico.clearErrors()

        populateValidParams(params)
        params.id = statusServico.id
        params.version = -1
        controller.update()

        assert view == "/statusServico/edit"
        assert model.statusServicoInstance != null
        assert model.statusServicoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/statusServico/list'

        response.reset()

        populateValidParams(params)
        def statusServico = new StatusServico(params)

        assert statusServico.save() != null
        assert StatusServico.count() == 1

        params.id = statusServico.id

        controller.delete()

        assert StatusServico.count() == 0
        assert StatusServico.get(statusServico.id) == null
        assert response.redirectedUrl == '/statusServico/list'
    }
}
