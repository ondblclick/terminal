TerminalScreen = require('../screen.coffee')
CameraScreen = require('./camera_screen.coffee')
Api = require('../api/api.coffee')

class MenuScreen extends TerminalScreen
  constructor: (@path, @atok) ->
    Api.getData(@atok)

  bindings: ->
    document.getElementById('camera').addEventListener 'click', (e) =>
      e.preventDefault()
      @navigateTo(new CameraScreen('camera'))

module.exports = MenuScreen
