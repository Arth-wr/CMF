package cmf



import org.junit.*
import grails.test.mixin.*

@TestFor(PecaController)
@Mock(Peca)
class PecaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/peca/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.pecaInstanceList.size() == 0
        assert model.pecaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.pecaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.pecaInstance != null
        assert view == '/peca/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/peca/show/1'
        assert controller.flash.message != null
        assert Peca.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/peca/list'

        populateValidParams(params)
        def peca = new Peca(params)

        assert peca.save() != null

        params.id = peca.id

        def model = controller.show()

        assert model.pecaInstance == peca
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/peca/list'

        populateValidParams(params)
        def peca = new Peca(params)

        assert peca.save() != null

        params.id = peca.id

        def model = controller.edit()

        assert model.pecaInstance == peca
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/peca/list'

        response.reset()

        populateValidParams(params)
        def peca = new Peca(params)

        assert peca.save() != null

        // test invalid parameters in update
        params.id = peca.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/peca/edit"
        assert model.pecaInstance != null

        peca.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/peca/show/$peca.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        peca.clearErrors()

        populateValidParams(params)
        params.id = peca.id
        params.version = -1
        controller.update()

        assert view == "/peca/edit"
        assert model.pecaInstance != null
        assert model.pecaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/peca/list'

        response.reset()

        populateValidParams(params)
        def peca = new Peca(params)

        assert peca.save() != null
        assert Peca.count() == 1

        params.id = peca.id

        controller.delete()

        assert Peca.count() == 0
        assert Peca.get(peca.id) == null
        assert response.redirectedUrl == '/peca/list'
    }
}
