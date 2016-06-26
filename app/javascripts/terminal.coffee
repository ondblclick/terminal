class Terminal
  @KEYS: ['k1', 'k2', 'k3', 'k4', 'k5', 'k6', 'k7', 'k8', 'k9', 'k10', 'k11']

  constructor: (@screen) ->
    @state = false

  terminal: ->
    document.querySelector('.terminal')

  el: ->
    document.getElementById('display')

  on: ->
    @terminal().classList.add 'terminal-on'
    @screen.run()
    Terminal.playSound('poweron')

  off: ->
    @terminal().classList.remove 'terminal-on'
    @el().innerHTML = ''
    Terminal.playSound('poweroff')

  toggle: ->
    @state = !@state
    if @state then @on() else @off()

  @playSound: (file) ->
    document.getElementById(file).play()

  @playRandomKey: ->
    document.getElementById(@KEYS[Math.floor(Math.random() * @KEYS.length)]).play()

module.exports = Terminal
