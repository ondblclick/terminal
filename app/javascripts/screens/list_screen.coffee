TerminalScreen = require('../screen.coffee')
Terminal = require('../terminal.coffee')

class ListScreen extends TerminalScreen
  @blackListItems: ['metadata']

  detach: ->
    @ref.off 'value'

  clear: ->
    Array.from(document.querySelectorAll('.display .dynamic')).forEach (el) -> el.remove()

  render: (snapshot) ->
    # if the page is a list of devices from a category
    if @parentItem in ['cameras', 'thermostats', 'smoke_co_alarms', 'structures']
      for k, v of snapshot.val()
        li = document.createElement('li')
        li.classList.add 'dynamic'
        a = document.createElement('a')
        a.href = '#'
        a.innerText = v.name
        a.onclick = =>
          Terminal.playSound('kenter')
          @navigateTo(Terminal.nav.create('ItemScreen', @parentItem, @ref.child(k)))

        li.appendChild a
        document.querySelector('.display ul').appendChild li

    # if the page is a simple list
    else
      Object.keys(snapshot.val()).forEach (listItem) =>
        return if listItem in @constructor.blackListItems
        li = document.createElement('li')
        li.classList.add 'dynamic'
        a = document.createElement('a')
        a.href = '#'
        a.innerText = listItem
        a.onclick = =>
          Terminal.playSound('kenter')
          @navigateTo(Terminal.nav.create('ListScreen', 'list', @ref.child(listItem), listItem))

        li.appendChild a
        document.querySelector('.display ul').appendChild li

  afterRun: ->
    TerminalScreen.startProgressBar()
    @ref.on 'value', (snapshot) =>
      TerminalScreen.stopProgressBar()
      @clear()
      @render(snapshot)

module.exports = ListScreen
