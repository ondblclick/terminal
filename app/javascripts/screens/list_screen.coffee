TerminalScreen = require('../screen.coffee')
Terminal = require('../terminal.coffee')

class ListScreen extends TerminalScreen
  detach: ->
    @ref.off 'value'

  afterRun: ->
    TerminalScreen.startProgressBar()
    @ref.on 'value', (snapshot) =>
      TerminalScreen.stopProgressBar()

      # if the page is a list of devices from a category
      if @parentItem in ['cameras', 'thermostats', 'smoke_co_alarms']
        for k, v of snapshot.val()
          li = document.createElement('li')
          a = document.createElement('a')
          a.href = '#'
          a.innerText = v.name_long
          a.onclick = =>
            Terminal.playSound('kenter')
            @navigateTo(Terminal.nav.create('DeviceScreen', 'device', @ref.child(k)))

          li.appendChild a
          document.querySelector('.display ul').appendChild li

      # if the page is a simple list
      else
        Object.keys(snapshot.val()).forEach (listItem) =>
          li = document.createElement('li')
          a = document.createElement('a')
          a.href = '#'
          a.innerText = listItem
          a.onclick = =>
            Terminal.playSound('kenter')
            @navigateTo(Terminal.nav.create('ListScreen', 'list', @ref.child(listItem), listItem))

          li.appendChild a
          document.querySelector('.display ul').appendChild li

    document.getElementById('back').addEventListener 'click', (e) =>
      e.preventDefault()
      Terminal.playSound('kenter')
      @navigateTo(Terminal.nav.back())

module.exports = ListScreen
