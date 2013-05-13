module Public::HomeHelper
  def event_attrs(event, index)
    @events_visible = 0 if index.zero?
    event.past? || @events_visible > 4 ? { :style => 'display: none;' } : (@events_visible += 1; {})
  end
end
