ListScreen = require('./screens/list_screen.coffee')
AuthorizeFailScreen = require('./screens/authorize_fail_screen.coffee')
AuthorizeScreen = require('./screens/authorize_screen.coffee')
ItemScreen = require('./screens/item_screen.coffee')

class Nav
  @constructors:
    'ListScreen': ListScreen
    'AuthorizeFailScreen': AuthorizeFailScreen
    'AuthorizeScreen': AuthorizeScreen
    'ItemScreen': ItemScreen

  @history: []

  @goTo: (current, name, rest...) ->
    if current
      current.detach()
      current.displayEl().innerHTML = ''
    @history.push([name, rest...])
    next = new @constructors[name](rest...)
    next.run()

  @back: ->
    rec = @history[@history.length - 2]
    @history.length = @history.length - 2
    rec

module.exports = Nav
