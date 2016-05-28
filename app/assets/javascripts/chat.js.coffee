$ ->
  $chatbox = $ '.chatbox'
  $textarea = $ '.chatbox-textarea'
  $messageContainer = $ '.message-container'
  $messages = $ '.messages'
  $window = $ window

  $messageContainer.css 'height', ($window.height() - $chatbox.height() - 160) + 'px'
  $messages.css 'max-height', ($window.height() - $chatbox.height() - 160) + 'px'

  $window.resize ->
    $messageContainer.css 'height', ($window.height() - $chatbox.height() - 160) + 'px'
    $messages.css 'max-height', ($window.height() - $chatbox.height() - 160) + 'px'
    $messages.scrollTop($messages[0].scrollHeight)

  socket = new WebSocket "ws://#{window.location.host}/chat"

  socket.onmessage = (event) ->
    if event.data.length
      $messages.append "<p class='message'>#{event.data}</p>"
      $messages.scrollTop($messages[0].scrollHeight)

  sendMessage = (event) ->
    event.preventDefault()
    socket.send $textarea.val()
    $textarea.val(null)
    $textarea.focus()

  $("#submit").click sendMessage
  $textarea.on 'keypress', (event) ->
    if event.keyCode == 13
      sendMessage event
