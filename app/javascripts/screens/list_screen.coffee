TerminalScreen = require('../screen.coffee')
Terminal = require('../terminal.coffee')
tmpl = require('../../templates/list_screen.hbs')

class ListScreen extends TerminalScreen
  @blackListItems: ['metadata']

  tmpl: -> tmpl()

  detach: ->
    @ref.off 'value'

  clear: ->
    Array.from(document.querySelectorAll('.screen .dynamic')).forEach (el) -> el.remove()

  appendLink: (text) ->
    li = document.createElement('li')
    li.classList.add 'dynamic'
    a = document.createElement('a')
    li.appendChild a
    a.href = '#'
    a.innerText = text
    document.querySelector('.screen ul').appendChild li

  render: (snapshot) ->
    # if the page is a list of devices from a category
    if @parentItem in ['cameras', 'thermostats', 'smoke_co_alarms', 'structures']
      for k, v of snapshot.val()
        return if k in @constructor.blackListItems
        a = @appendLink(v.name)
        a.onclick = =>
          Terminal.playSound('kenter')
          Terminal.Nav.goTo(@, 'ItemScreen', @parentItem, @ref.child(k))

    # if the page is a simple list
    else
      # for ... of doesn't see `structures` property somehow
      Object.keys(snapshot.val()).forEach (listItem) =>
        return if listItem in @constructor.blackListItems
        a = @appendLink(listItem)
        a.onclick = =>
          Terminal.playSound('kenter')
          Terminal.Nav.goTo(@, 'ListScreen', 'list', @ref.child(listItem), listItem)

  afterRun: ->
    TerminalScreen.startProgressBar()
    @ref.on 'value', (snapshot) =>
      TerminalScreen.stopProgressBar()
      @clear()
      @render(snapshot)

module.exports = ListScreen
