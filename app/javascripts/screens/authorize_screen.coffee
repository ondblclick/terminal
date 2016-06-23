TerminalScreen = require('../screen.coffee')
AuthorizeFailScreen = require('./authorize_fail_screen.coffee')
MenuScreen = require('./menu_screen.coffee')
Api = require('../api/api.coffee')

class AuthorizeScreen extends TerminalScreen
  bindings: ->
    document.getElementById('ok').addEventListener 'click', (e) =>
      Api.getToken (atok) =>
        @navigateTo(new MenuScreen('menu', atok)) if atok

    document.getElementById('symbols').addEventListener 'click', (e) ->
      return unless e.target.tagName is 'A'
      document.getElementById('input').innerText += e.target.innerText

    # document.getElementById('fail').addEventListener 'click', (e) =>
    #   e.preventDefault()
    #   @navigateTo(new AuthorizeFailScreen('authorize_fail'))
    #
    # document.getElementById('success').addEventListener 'click', (e) =>
    #   e.preventDefault()
    #   @navigateTo(new MenuScreen('menu'))

module.exports = AuthorizeScreen
