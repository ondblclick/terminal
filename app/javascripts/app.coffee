Terminal = require('./terminal.coffee')
Nav = require('./nav.coffee')

Terminal.Nav = Nav
terminal = new Terminal()
document.getElementById('power-button').addEventListener 'click', terminal.toggle.bind(terminal)
