package cmf



import org.junit.*
import grails.test.mixin.*

@TestFor(TipoPneuController)
@Mock(TipoPneu)
class TipoPneuControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/tipoPneu/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.tipoPneuInstanceList.size() == 0
        assert model.tipoPneuInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.tipoPneuInstance != null
    }

    void testSave() {
        controller.save()

        assert model.tipoPneuInstance != null
        assert view == '/tipoPneu/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/tipoPneu/show/1'
        assert controller.flash.message != null
        assert TipoPneu.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoPneu/list'

        populateValidParams(params)
        def tipoPneu = new TipoPneu(params)

        assert tipoPneu.save() != null

        params.id = tipoPneu.id

        def model = controller.show()

        assert model.tipoPneuInstance == tipoPneu
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoPneu/list'

        populateValidParams(params)
        def tipoPneu = new TipoPneu(params)

        assert tipoPneu.save() != null

        params.id = tipoPneu.id

        def model = controller.edit()

        assert model.tipoPneuInstance == tipoPneu
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoPneu/list'

        response.reset()

        populateValidParams(params)
        def tipoPneu = new TipoPneu(params)

        assert tipoPneu.save() != null

        // test invalid parameters in update
        params.id = tipoPneu.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/tipoPneu/edit"
        assert model.tipoPneuInstance != null

        tipoPneu.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/tipoPneu/show/$tipoPneu.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        tipoPneu.clearErrors()

        populateValidParams(params)
        params.id = tipoPneu.id
        params.version = -1
        controller.update()

        assert view == "/tipoPneu/edit"
        assert model.tipoPneuInstance != null
        assert model.tipoPneuInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/tipoPneu/list'

        response.reset()

        populateValidParams(params)
        def tipoPneu = new TipoPneu(params)

        assert tipoPneu.save() != null
        assert TipoPneu.count() == 1

        params.id = tipoPneu.id

        controller.delete()

        assert TipoPneu.count() == 0
        assert TipoPneu.get(tipoPneu.id) == null
        assert response.redirectedUrl == '/tipoPneu/list'
    }
}
