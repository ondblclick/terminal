class TerminalScreen
  constructor: (@path) ->

  el: ->
    document.getElementById(@path)

  displayEl: ->
    document.getElementById('display')

  navigateTo: (screen) ->
    document.querySelector('#display .screen-inner').classList.add('remove')
    setTimeout screen.run.bind(screen), 500

  run: ->
    @displayEl().innerHTML = ''
    @displayEl().appendChild(@el().children[0].cloneNode(true))

module.exports = TerminalScreen
