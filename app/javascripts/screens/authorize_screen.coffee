TerminalScreen = require('../screen.coffee')
AuthorizeFailScreen = require('./authorize_fail_screen.coffee')
MenuScreen = require('./menu_screen.coffee')

class AuthorizeScreen extends TerminalScreen
  bindings: ->
    document.getElementById('fail').addEventListener 'click', (e) =>
      e.preventDefault()
      @navigateTo(new AuthorizeFailScreen('authorize_fail'))

    document.getElementById('success').addEventListener 'click', (e) =>
      e.preventDefault()
      @navigateTo(new MenuScreen('menu'))

module.exports = AuthorizeScreen
