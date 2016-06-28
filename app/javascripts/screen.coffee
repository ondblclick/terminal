Terminal = require('./terminal.coffee')

class TerminalScreen
  constructor: (@path, @ref, @parentItem) ->
    @interval = false

  tmpl: ->

  afterRun: ->

  detach: ->

  bindings: ->
    backBtn = document.getElementById('back')
    return unless backBtn
    backBtn.addEventListener 'click', (e) =>
      e.preventDefault()
      Terminal.playSound('kenter')
      Terminal.Nav.goTo(@, Terminal.Nav.back()...)

  run: ->
    Terminal.screen().innerHTML = @tmpl()
    @afterRun()
    @bindings()

  cloneTemplate: ->
    document.getElementById(@path).children[0].cloneNode(true)

  @startProgressBar: ->
    @stopProgressBar()
    el = document.querySelector('.screen .progressbar')
    unless el
      el = document.createElement('div')
      el.classList.add('progressbar')
      el.innerText = 'Loading'
      document.querySelector('.screen .screen-inner').appendChild(el)

    @interval = setInterval ->
      el.innerText += '.'
    , 500

  @stopProgressBar: ->
    clearInterval(@interval)
    el = document.querySelector('.screen .progressbar')
    el.remove() if el

module.exports = TerminalScreen
