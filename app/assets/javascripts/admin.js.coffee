#= require jquery
#= require jquery_ujs
#= require bootstrap-all
#= require ham
#= require_self

$(document).delegate 'a[data-stop]', 'click.rails', (e)->
  $.rails.stopEverything(e)
