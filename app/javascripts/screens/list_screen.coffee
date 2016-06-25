TerminalScreen = require('../screen.coffee')

class ListScreen extends TerminalScreen
  constructor: (@path, @ref) ->

  afterRun: ->
    @ref.on 'value', (snapshot) ->
      console.log snapshot.val()

module.exports = ListScreen
