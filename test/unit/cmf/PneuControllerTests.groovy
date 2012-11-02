package cmf



import org.junit.*
import grails.test.mixin.*

@TestFor(PneuController)
@Mock(Pneu)
class PneuControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/pneu/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.pneuInstanceList.size() == 0
        assert model.pneuInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.pneuInstance != null
    }

    void testSave() {
        controller.save()

        assert model.pneuInstance != null
        assert view == '/pneu/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/pneu/show/1'
        assert controller.flash.message != null
        assert Pneu.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/pneu/list'

        populateValidParams(params)
        def pneu = new Pneu(params)

        assert pneu.save() != null

        params.id = pneu.id

        def model = controller.show()

        assert model.pneuInstance == pneu
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/pneu/list'

        populateValidParams(params)
        def pneu = new Pneu(params)

        assert pneu.save() != null

        params.id = pneu.id

        def model = controller.edit()

        assert model.pneuInstance == pneu
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/pneu/list'

        response.reset()

        populateValidParams(params)
        def pneu = new Pneu(params)

        assert pneu.save() != null

        // test invalid parameters in update
        params.id = pneu.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/pneu/edit"
        assert model.pneuInstance != null

        pneu.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/pneu/show/$pneu.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        pneu.clearErrors()

        populateValidParams(params)
        params.id = pneu.id
        params.version = -1
        controller.update()

        assert view == "/pneu/edit"
        assert model.pneuInstance != null
        assert model.pneuInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/pneu/list'

        response.reset()

        populateValidParams(params)
        def pneu = new Pneu(params)

        assert pneu.save() != null
        assert Pneu.count() == 1

        params.id = pneu.id

        controller.delete()

        assert Pneu.count() == 0
        assert Pneu.get(pneu.id) == null
        assert response.redirectedUrl == '/pneu/list'
    }
}
