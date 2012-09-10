$ ->

  $(document).bind 'ajaxSend', (e, xhr, options)->
    $('#loader').show()
    $('form#new_patron').css opacity: .5

  $(document).bind 'ajaxComplete', (e, xhr, options)->
    $('#loader').hide()
    $('form#new_patron').replaceWith xhr.responseText
    $('#boom').fadeIn 50, ->
      $(this).fadeOut 2000
