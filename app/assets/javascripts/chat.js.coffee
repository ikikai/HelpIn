$ ->
  $chatbox = $ '.chatbox'
  $textarea = $ '.chatbox-textarea'
  $messageContainer = $ '.message-container'
  $messages = $ '.messages'
  $window = $ window

  $messageContainer.css 'height', ($window.height() - $chatbox.height() - 234) + 'px'
  $messages.css 'max-height', ($window.height() - $chatbox.height() - 234) + 'px'

  $window.resize ->
    $messageContainer.css 'height', ($window.height() - $chatbox.height() - 234) + 'px'
    $messages.css 'max-height', ($window.height() - $chatbox.height() - 234) + 'px'
    $messages.scrollTop($messages[0].scrollHeight)

  socket = new WebSocket "ws://#{window.location.host}/chat"

  socket.onmessage = (event) ->
    if event.data.length
      $messages.append "<div class='bubble-container'><span class='bubble'>#{event.data}</span></div>"
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

  $panel = $ '.row-offcanvas'
  $('#toggle_active_users').click ->
    $panel.removeClass('row-offcanvas-right').addClass('row-offcanvas-left')
    setTimeout(->

      if $panel.hasClass('active')
        setTimeout(->
          $('#active-users').hide()
        , 250)
      else
        $('#active-users').show()
      $panel.toggleClass('active')

    , 100)

  $('#toggle_queue').click ->
    $panel.removeClass('row-offcanvas-left').addClass('row-offcanvas-right')
    setTimeout(->

      if $panel.hasClass('active')
        setTimeout(->
          $('#queue').hide()
        , 250)
      else
        $('#queue').show()
      $panel.toggleClass('active')

    , 100)
