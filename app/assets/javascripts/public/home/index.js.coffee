$ ->

  $(document).bind 'ajaxSend', (e, xhr, options)->
    $('#loader').show()
    $('form#new_patron').css opacity: .5

  $(document).bind 'ajaxComplete', (e, xhr, options)->
    $('#loader').hide()
    $('form#new_patron').replaceWith xhr.responseText
    $('form#new_patron').find('input[type=text]').select()
    if xhr.status == 200
      $('#boom').fadeIn 50, ->
        $(this).fadeOut 1500
