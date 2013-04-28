Ham.register 'Index::Calendar', (options)->

  events = options.el.find('li:not(.cntrl)')
  cntrls = options.el.find('li.cntrl')

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
