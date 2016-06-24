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

  runProgressBar: ->
    interval = setInterval(->
      if document.querySelector('.display .progressbar')
        document.querySelector('.display .progressbar').innerHTML += '*'
      else
        clearInterval(interval)
    , 500)

module.exports = TerminalScreen
