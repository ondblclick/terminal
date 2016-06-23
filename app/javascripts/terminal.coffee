class Terminal
  constructor: ({ @startScreen }) ->

  el: ->
    document.getElementById('display')

  on: ->
    @startScreen.run()

  off: ->
    @el().innerHTML = ''

module.exports = Terminal
