class Terminal
  @KEYS: ['k1', 'k2', 'k3', 'k4', 'k5', 'k6', 'k7', 'k8', 'k9', 'k10', 'k11']

  constructor: ({ @startScreen, @nav }) ->

  el: ->
    document.getElementById('display')

  on: ->
    @startScreen.run()
    Terminal.playSound('poweron')

  off: ->
    @el().innerHTML = ''
    Terminal.playSound('poweroff')

  @playSound: (file) ->
    document.getElementById(file).play()

  @playRandomKey: ->
    document.getElementById(@KEYS[Math.floor(Math.random() * @KEYS.length)]).play()

module.exports = Terminal
