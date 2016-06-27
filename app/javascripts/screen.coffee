Terminal = require('./terminal.coffee')

class TerminalScreen
  constructor: (@path, @ref, @parentItem) ->
    @interval = false

  afterRun: ->

  detach: ->

  bindings: ->
    document.getElementById('back').addEventListener 'click', (e) =>
      e.preventDefault()
      Terminal.playSound('kenter')
      Terminal.Nav.goTo(@, Terminal.Nav.back()...)

  el: ->
    document.getElementById(@path)

  displayEl: ->
    document.getElementById('display')

  run: ->
    @displayEl().innerHTML = ''
    @displayEl().appendChild(@el().children[0].cloneNode(true))
    @afterRun()
    @bindings()

  @startProgressBar: ->
    @stopProgressBar()
    el = document.querySelector('.display .progressbar')
    unless el
      el = document.createElement('div')
      el.classList.add('progressbar')
      el.innerText = 'Loading'
      document.querySelector('.display .screen-inner').appendChild(el)

    @interval = setInterval ->
      el.innerText += '.'
    , 500

  @stopProgressBar: ->
    clearInterval(@interval)
    el = document.querySelector('.display .progressbar')
    el.remove() if el

module.exports = TerminalScreen
