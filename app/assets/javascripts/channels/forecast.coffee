App.forecast = App.cable.subscriptions.create "ForecastChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    console.log('connected to action cable')

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    # console.log('received: ', data)
    document.getElementById('weathers').innerHTML = data.partial

  refresh: () ->
    @perform 'refresh'
