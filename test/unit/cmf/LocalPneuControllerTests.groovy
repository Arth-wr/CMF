package cmf



import org.junit.*
import grails.test.mixin.*

@TestFor(LocalPneuController)
@Mock(LocalPneu)
class LocalPneuControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/localPneu/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.localPneuInstanceList.size() == 0
        assert model.localPneuInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.localPneuInstance != null
    }

    void testSave() {
        controller.save()

        assert model.localPneuInstance != null
        assert view == '/localPneu/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/localPneu/show/1'
        assert controller.flash.message != null
        assert LocalPneu.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/localPneu/list'

        populateValidParams(params)
        def localPneu = new LocalPneu(params)

        assert localPneu.save() != null

        params.id = localPneu.id

        def model = controller.show()

        assert model.localPneuInstance == localPneu
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/localPneu/list'

        populateValidParams(params)
        def localPneu = new LocalPneu(params)

        assert localPneu.save() != null

        params.id = localPneu.id

        def model = controller.edit()

        assert model.localPneuInstance == localPneu
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/localPneu/list'

        response.reset()

        populateValidParams(params)
        def localPneu = new LocalPneu(params)

        assert localPneu.save() != null

        // test invalid parameters in update
        params.id = localPneu.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/localPneu/edit"
        assert model.localPneuInstance != null

        localPneu.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/localPneu/show/$localPneu.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        localPneu.clearErrors()

        populateValidParams(params)
        params.id = localPneu.id
        params.version = -1
        controller.update()

        assert view == "/localPneu/edit"
        assert model.localPneuInstance != null
        assert model.localPneuInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/localPneu/list'

        response.reset()

        populateValidParams(params)
        def localPneu = new LocalPneu(params)

        assert localPneu.save() != null
        assert LocalPneu.count() == 1

        params.id = localPneu.id

        controller.delete()

        assert LocalPneu.count() == 0
        assert LocalPneu.get(localPneu.id) == null
        assert response.redirectedUrl == '/localPneu/list'
    }
}
