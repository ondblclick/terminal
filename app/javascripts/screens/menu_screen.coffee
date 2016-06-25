TerminalScreen = require('../screen.coffee')
Terminal = require('../terminal.coffee')
ListScreen = require('./list_screen.coffee')
Api = require('../api/api.coffee')

class MenuScreen extends TerminalScreen
  constructor: (@path, @atok) ->

  afterRun: ->
    TerminalScreen.startProgressBar()
    ref = Api.getData(@atok).child('devices')
    ref.on 'value', (snapshot) =>
      TerminalScreen.stopProgressBar()
      Object.keys(snapshot.val()).forEach (deviceName) =>
        li = document.createElement('li')
        a = document.createElement('a')
        a.href = '#'
        a.id = deviceName
        a.innerText = deviceName
        a.onclick = =>
          Terminal.playSound('kenter')
          @navigateTo(new ListScreen('list', ref.child(deviceName)))

        li.appendChild(a)
        document.querySelector('.display #devices').appendChild li

module.exports = MenuScreen
