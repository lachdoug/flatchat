App.events = App.cable.subscriptions.create "ServerUpdatesChannel",
  connected: ->
      return
    # Called when the subscription is ready for use on the server

  disconnected: ->
    return
    # Called when the subscription has been terminated by the server

  received: (data) ->
    if data['event'] == 'new_room'
      $('#rooms').prepend(data['room'])
    else
      $('#messages').prepend(data['message'])
    return

  speak: (data) ->
    # @perform 'speak', event: data
