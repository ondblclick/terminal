TerminalScreen = require('../screen.coffee')
AuthorizeFailScreen = require('./authorize_fail_screen.coffee')
MenuScreen = require('./menu_screen.coffee')
Api = require('../api/api.coffee')

class AuthorizeScreen extends TerminalScreen
  afterRun: ->
    document.getElementById('ok').addEventListener 'click', (e) =>
      TerminalScreen.startProgressBar()
      pin = document.getElementById('input').innerText
      Api.getToken pin, (res) =>
        TerminalScreen.stopProgressBar()
        nextScreen = if res.access_token
          new MenuScreen('menu', res.access_token)
        else
          new AuthorizeFailScreen('authorize_fail', "(#{res.error_description})")
        @navigateTo nextScreen

    document.getElementById('symbols').addEventListener 'click', (e) ->
      return unless e.target.tagName is 'A'
      document.getElementById('input').innerText += e.target.innerText

module.exports = AuthorizeScreen
