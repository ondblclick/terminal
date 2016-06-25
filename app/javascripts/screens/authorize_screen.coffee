TerminalScreen = require('../screen.coffee')
Terminal = require('../terminal.coffee')
AuthorizeFailScreen = require('./authorize_fail_screen.coffee')
MenuScreen = require('./menu_screen.coffee')
Api = require('../api/api.coffee')

class AuthorizeScreen extends TerminalScreen
  afterRun: ->
    document.getElementById('ok').addEventListener 'click', (e) =>
      Terminal.playSound('kenter')
      TerminalScreen.startProgressBar()
      pin = document.getElementById('input').innerText
      Api.getToken pin, (res) =>
        TerminalScreen.stopProgressBar()
        if res.access_token
          nextScreen = new MenuScreen('menu', res.access_token)
          Terminal.playSound('passgood')
        else
          nextScreen = new AuthorizeFailScreen('authorize_fail', "(#{res.error_description})")
          Terminal.playSound('passbad')
        @navigateTo nextScreen

    document.getElementById('symbols').addEventListener 'click', (e) ->
      return unless e.target.tagName is 'A'
      document.getElementById('input').innerText += e.target.innerText
      Terminal.playRandomKey()

module.exports = AuthorizeScreen
