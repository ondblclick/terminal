TerminalScreen = require('../screen.coffee')

class DeviceScreen extends TerminalScreen
  detach: ->
    @ref.off 'value'

  clear: ->

  render: (snapshot) ->
    console.log snapshot.val()

  afterRun: ->
    @ref.on 'value', (snapshot) =>
      @clear()
      @render(snapshot)

module.exports = DeviceScreen
