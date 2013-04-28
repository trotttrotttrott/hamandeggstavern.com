Ham.register 'Index::Calendar', (options)->

  events = options.el.find('li:not(.cntrl)')
  cntrls = options.el.find('li.cntrl')

  group_events = ->
    e = left: [], center: [], right: []
    visible_set = false
    for el in events
      do (el) ->
        switch
          when !$(el).is(':visible') && !visible_set
            e.left.push(el)
          when $(el).is(':visible')
            visible_set = true
            e.center.push(el)
          else
            e.right.push(el)
    e

  # browsing

  cntrls.first().bind 'click', (e)->
    grouped_events = group_events()
    return if grouped_events.left.length == 0
    $(grouped_events.left).last().fadeIn()
    $(grouped_events.center).last().hide()

  cntrls.last().bind 'click', (e)->
    grouped_events = group_events()
    return if grouped_events.right.length == 0
    $(grouped_events.right).first().fadeIn()
    $(grouped_events.center).first().hide()

  # resizing

  event_width = events.first().outerWidth() + 1
  cntrl_width = cntrls.first().outerWidth() + 1

  show_max_events = ->
    viewport_width = $(window).outerWidth()
    room_for = parseInt((viewport_width - (cntrl_width * 2)) / event_width)
    visible_now = events.filter(':visible').length
    if room_for > visible_now
      $(el).show() for el in group_events().right[0..(room_for - visible_now - 1)]
    else
      return if visible_now == 1
      $(el).hide() for el in group_events().center[(visible_now - (visible_now - room_for))..(visible_now - 1)]

  show_max_events()

  $(window).resize show_max_events

  return
