TerminalScreen = require('../screen.coffee')

class AuthorizeFailScreen extends TerminalScreen
  constructor: (@path, @message) ->
  run: ->
    super()
    document.getElementById('message').innerText = @message if @message

module.exports = AuthorizeFailScreen
