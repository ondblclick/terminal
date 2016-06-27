class Terminal
  @KEYS: ['k1', 'k2', 'k3', 'k4', 'k5', 'k6', 'k7', 'k8', 'k9', 'k10', 'k11']

  @el: ->
    document.querySelector('.terminal')

  @screen: ->
    document.getElementById('screen')

  @playSound: (file) ->
    document.getElementById(file).play()

  @playRandomKey: ->
    document.getElementById(@KEYS[Math.floor(Math.random() * @KEYS.length)]).play()

  constructor: ->
    @state = false

  on: ->
    Terminal.el().classList.add 'terminal-on'
    Terminal.Nav.goTo(null, 'AuthorizeScreen', 'authorize')
    Terminal.playSound('poweron')

  off: ->
    Terminal.el().classList.remove 'terminal-on'
    Terminal.screen().innerHTML = ''
    Terminal.playSound('poweroff')

  toggle: ->
    @state = !@state
    if @state then @on() else @off()

module.exports = Terminal
