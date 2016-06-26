TerminalScreen = require('../screen.coffee')

class DeviceScreen extends TerminalScreen
  @fields =
    'structures': [
      'name',
      'country_code',
      'postal_code',
      'time_zone'
    ],
    'cameras': [
      'software_version',
      'name_long',
      'is_online',
      'is_streaming',
      'publi_share_url'
    ],
    'smoke_co_alarms': [
      'software_version',
      'name_long',
      'is_online',
      'battery_health',
      'co_alarm_state',
      'smoke_alarm_state',
      'ui_color_state'
    ],
    'thermostats': [
      'software_version',
      'name_long',
      'is_online',
      'can_cool',
      'can_heat',
      'has_fan',
      'temperature_scale',
      'target_temperature_c',
      'is_locked'
    ]

  detach: ->
    @ref.off 'value'

  clear: ->
    document.querySelector('.display .dynamic').innerHTML = '' if document.querySelector('.display .dynamic')

  render: (snapshot) ->
    for k, v of snapshot.val()
      if k in @constructor.fields[@path]
        li = document.createElement('li')
        li.innerText = "#{k}: #{v}"
        document.querySelector('.display .info').appendChild(li)

  afterRun: ->
    @ref.on 'value', (snapshot) =>
      @clear()
      @render(snapshot)

module.exports = DeviceScreen
