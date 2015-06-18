# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "page:change", ->
  $('div[id^="task-"]').hoverIntent( ->
    item = $(this)        
    item.find('.icons').show(300)
  ,->
    $(this).find('.icons').hide(300))
 
 