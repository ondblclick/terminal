ListScreen = require('./screens/list_screen.coffee')
AuthorizeFailScreen = require('./screens/authorize_fail_screen.coffee')
AuthorizeScreen = require('./screens/authorize_screen.coffee')
DeviceScreen = require('./screens/device_screen.coffee')

class Nav
  @constructors:
    'ListScreen': ListScreen
    'AuthorizeFailScreen': AuthorizeFailScreen
    'AuthorizeScreen': AuthorizeScreen
    'DeviceScreen': DeviceScreen

  @history: []

  @create: (name, rest...) ->
    @history.push([name, rest...])
    screen = new @constructors[name](rest...)
    screen

  @back: ->
    rec = @history[@history.length - 2]
    @history.length = @history.length - 2
    @create(rec...)

module.exports = Nav
