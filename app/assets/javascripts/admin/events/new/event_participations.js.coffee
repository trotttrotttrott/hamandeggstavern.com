Ham.register 'Events::Form::EventParticipations', (options)->

  select_acts = $('#select_acts')
  act_ids = $('#act_ids')
  acts = $('#acts')

  act_hidden_field = $('#act_ids :first-child').remove()
  act_list_item    = $('#acts li:first-child').remove()

  $('#add_act_to_event').bind 'click', (e)->
    option = select_acts.find('option:selected')
    act_id = act_hidden_field.clone()
    return if act_ids.find("[value=#{option.val()}]").size() > 0 || option.val() == ''
    act_id.val(option.val())
    act_id.appendTo(act_ids)
    li = act_list_item.clone()
    li.attr('data-act-id', option.val())
    li.find('span').html(option.html())
    li.appendTo(acts)

  options.el.delegate '.icon-remove', 'click', (e)->
    li = $(e.currentTarget).closest('li')
    act_id = li.data('act-id')
    li.remove()
    act_ids.find("[value=#{act_id}]").remove()
