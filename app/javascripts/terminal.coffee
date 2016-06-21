class Terminal
  constructor: ({ @startScreen }) ->

  el: ->
    document.getElementById('display')

  on: ->
    @startScreen.run()
    @startScreen.bindings()

  off: ->
    @el().innerHTML = ''

module.exports = Terminal
