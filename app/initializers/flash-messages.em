`import FlashController from "../controllers/flash"`
Initializer =
  name: 'setup-flash-messages'
  initialize: (container, application) ->
    application.register 'flash:main', FlashController, instantiate: true, singleton: true
    application.inject 'controller', 'flash', 'flash:main'
    application.inject 'route', 'flash', 'flash:main'
    application.inject 'view:flash', 'flash', 'flash:main'

`export default Initializer`
