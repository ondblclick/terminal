class TerminalScreen
  constructor: (@path) ->

  bindings: ->

  el: ->
    document.getElementById(@path)

  displayEl: ->
    document.getElementById('display')

  navigateTo: (screen) ->
    @displayEl().innerHTML = ''
    screen.run()

  run: ->
    @displayEl().innerHTML = ''
    @displayEl().appendChild(@el().children[0].cloneNode(true))
    @bindings()

module.exports = TerminalScreen
