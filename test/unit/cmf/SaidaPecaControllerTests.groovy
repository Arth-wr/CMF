package cmf



import org.junit.*
import grails.test.mixin.*

@TestFor(SaidaPecaController)
@Mock(SaidaPeca)
class SaidaPecaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/saidaPeca/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.saidaPecaInstanceList.size() == 0
        assert model.saidaPecaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.saidaPecaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.saidaPecaInstance != null
        assert view == '/saidaPeca/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/saidaPeca/show/1'
        assert controller.flash.message != null
        assert SaidaPeca.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/saidaPeca/list'

        populateValidParams(params)
        def saidaPeca = new SaidaPeca(params)

        assert saidaPeca.save() != null

        params.id = saidaPeca.id

        def model = controller.show()

        assert model.saidaPecaInstance == saidaPeca
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/saidaPeca/list'

        populateValidParams(params)
        def saidaPeca = new SaidaPeca(params)

        assert saidaPeca.save() != null

        params.id = saidaPeca.id

        def model = controller.edit()

        assert model.saidaPecaInstance == saidaPeca
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/saidaPeca/list'

        response.reset()

        populateValidParams(params)
        def saidaPeca = new SaidaPeca(params)

        assert saidaPeca.save() != null

        // test invalid parameters in update
        params.id = saidaPeca.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/saidaPeca/edit"
        assert model.saidaPecaInstance != null

        saidaPeca.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/saidaPeca/show/$saidaPeca.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        saidaPeca.clearErrors()

        populateValidParams(params)
        params.id = saidaPeca.id
        params.version = -1
        controller.update()

        assert view == "/saidaPeca/edit"
        assert model.saidaPecaInstance != null
        assert model.saidaPecaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/saidaPeca/list'

        response.reset()

        populateValidParams(params)
        def saidaPeca = new SaidaPeca(params)

        assert saidaPeca.save() != null
        assert SaidaPeca.count() == 1

        params.id = saidaPeca.id

        controller.delete()

        assert SaidaPeca.count() == 0
        assert SaidaPeca.get(saidaPeca.id) == null
        assert response.redirectedUrl == '/saidaPeca/list'
    }
}
