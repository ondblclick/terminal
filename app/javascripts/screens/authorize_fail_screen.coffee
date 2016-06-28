TerminalScreen = require('../screen.coffee')
tmpl = require('../../templates/authorize_fail_screen.hbs')

class AuthorizeFailScreen extends TerminalScreen
  constructor: (@path, @message) ->

  tmpl: -> tmpl()

  afterRun: ->
    document.getElementById('message').innerText = @message if @message

module.exports = AuthorizeFailScreen
