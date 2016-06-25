class TerminalScreen
  constructor: (@path) ->
    @interval = false

  afterRun: ->

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
    @afterRun()

  @startProgressBar: ->
    @stopProgressBar()
    el = document.querySelector('.display .progressbar')
    unless el
      el = document.createElement('div')
      el.classList.add('progressbar')
      document.querySelector('.display .screen-inner').appendChild(el)

    @interval = setInterval ->
      el.innerHTML += '*'
    , 500

  @stopProgressBar: ->
    clearInterval(@interval)
    el = document.querySelector('.display .progressbar')
    el.remove() if el

module.exports = TerminalScreen
