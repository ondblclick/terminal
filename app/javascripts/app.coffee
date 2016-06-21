Terminal = require('./terminal.coffee')
AuthorizeScreen = require('./screens/authorize_screen.coffee')

terminal = new Terminal({ startScreen: new AuthorizeScreen('authorize') })

document.getElementById('power-button').addEventListener 'click', (e) ->
  term = e.target.parentNode

  term.classList.toggle 'terminal-on'
  if term.classList.contains('terminal-on')
    terminal.on()
  else
    terminal.off()
