TerminalScreen = require('../screen.coffee')

class DeviceScreen extends TerminalScreen
  afterRun: ->
    @ref.on 'value', (snapshot) ->
      console.log snapshot.val()

    document.getElementById('back').addEventListener 'click', (e) =>
      e.preventDefault()
      Terminal.playSound('kenter')
      @navigateTo(Terminal.nav.back())

module.exports = DeviceScreen
