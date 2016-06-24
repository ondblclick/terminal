TerminalScreen = require('../screen.coffee')
AuthorizeFailScreen = require('./authorize_fail_screen.coffee')
MenuScreen = require('./menu_screen.coffee')
Api = require('../api/api.coffee')

class AuthorizeScreen extends TerminalScreen
  bindings: ->
    document.getElementById('ok').addEventListener 'click', (e) =>
      @runProgressBar()
      Api.getToken (res) =>
        if res.access_token
          @navigateTo(new MenuScreen('menu', res.access_token))
        else
          @navigateTo(new AuthorizeFailScreen('authorize_fail', "(#{res.error_description})"))

    document.getElementById('symbols').addEventListener 'click', (e) ->
      return unless e.target.tagName is 'A'
      document.getElementById('input').innerText += e.target.innerText

module.exports = AuthorizeScreen
