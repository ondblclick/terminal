TerminalScreen = require('../screen.coffee')

class AuthorizeFailScreen extends TerminalScreen
  constructor: (@path, @message) ->

  afterRun: ->
    document.getElementById('message').innerText = @message if @message

module.exports = AuthorizeFailScreen
