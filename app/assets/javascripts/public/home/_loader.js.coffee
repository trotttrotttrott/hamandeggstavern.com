Ham.register 'Index::Loader', (options)->

  $(document).bind 'ajaxSend', (e, xhr, options)->
    $('#loader').show()
    $('#form').css opacity: .5

  $(document).bind 'ajaxComplete', (e, xhr, options)->
    $('#loader').hide()
    $('#form').replaceWith xhr.responseText
    $('#form').find('input[type=text]').select()
