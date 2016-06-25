TerminalScreen = require('../screen.coffee')
CameraScreen = require('./camera_screen.coffee')
Api = require('../api/api.coffee')

class MenuScreen extends TerminalScreen
  constructor: (@path, @atok) ->

  afterRun: ->
    document.getElementById('camera').addEventListener 'click', (e) =>
      e.preventDefault()
      @navigateTo(new CameraScreen('camera'))

    TerminalScreen.startProgressBar()
    ref = Api.getData @atok
    ref.on 'value', (snapshot) ->
      TerminalScreen.stopProgressBar()
      Object.keys(snapshot.val().devices).forEach (deviceName) ->
        li = document.createElement('li')
        li.innerText = deviceName
        a = document.createElement('a')
        a.href = '#'
        li.appendChild(a)
        document.querySelector('.display #devices').appendChild li

module.exports = MenuScreen
