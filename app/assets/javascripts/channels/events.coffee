App.events = App.cable.subscriptions.create "EventsChannel",
  connected: ->
      return
    # Called when the subscription is ready for use on the server

  disconnected: ->
    return
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # eval(data['event'])
    alert(data['event'])
    return

  speak: (data) ->
    @perform 'speak', event: data
