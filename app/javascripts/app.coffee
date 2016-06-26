Terminal = require('./terminal.coffee')
AuthorizeScreen = require('./screens/authorize_screen.coffee')
Nav = require('./nav.coffee')

Terminal.nav = Nav
terminal = new Terminal Terminal.nav.create('AuthorizeScreen', 'authorize')
document.getElementById('power-button').addEventListener 'click', terminal.toggle.bind(terminal)
