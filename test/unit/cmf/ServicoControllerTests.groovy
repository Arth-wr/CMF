package cmf



import org.junit.*
import grails.test.mixin.*

@TestFor(ServicoController)
@Mock(Servico)
class ServicoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/servico/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.servicoInstanceList.size() == 0
        assert model.servicoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.servicoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.servicoInstance != null
        assert view == '/servico/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/servico/show/1'
        assert controller.flash.message != null
        assert Servico.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/servico/list'

        populateValidParams(params)
        def servico = new Servico(params)

        assert servico.save() != null

        params.id = servico.id

        def model = controller.show()

        assert model.servicoInstance == servico
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/servico/list'

        populateValidParams(params)
        def servico = new Servico(params)

        assert servico.save() != null

        params.id = servico.id

        def model = controller.edit()

        assert model.servicoInstance == servico
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/servico/list'

        response.reset()

        populateValidParams(params)
        def servico = new Servico(params)

        assert servico.save() != null

        // test invalid parameters in update
        params.id = servico.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/servico/edit"
        assert model.servicoInstance != null

        servico.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/servico/show/$servico.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        servico.clearErrors()

        populateValidParams(params)
        params.id = servico.id
        params.version = -1
        controller.update()

        assert view == "/servico/edit"
        assert model.servicoInstance != null
        assert model.servicoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/servico/list'

        response.reset()

        populateValidParams(params)
        def servico = new Servico(params)

        assert servico.save() != null
        assert Servico.count() == 1

        params.id = servico.id

        controller.delete()

        assert Servico.count() == 0
        assert Servico.get(servico.id) == null
        assert response.redirectedUrl == '/servico/list'
    }
}
