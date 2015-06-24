# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "page:change", ->

  currentHover =
    element:  0

  $('.entire-task').hoverIntent( ->
    currentHover.element = $(this) 
    $(this) .find('.icons').show(300)
  ,->
    $(this).find('.icons').hide(300))

  $('.add-task-button').click( ->
    $('.add-today').toggle(100)
    $('.today-task-field').focus()
    $(this).hide()
  )

  $('.cancel').click( ->
    $('.add-today').hide()
    $('.add-task-button').show()
  )

  $('.pencil').click( ->
    currentHover.element.find('.edit-task-form').show()

    selectedTask = currentHover.element.find('.to-do').text()

    currentHover.element.find('.edit-task-field').val(selectedTask.trim())
    currentHover.element.find('.all-list-data').toggle()
    currentHover.element.find('.edit-task-field').focus()

 
  )

  $('.edit-cancel').click( ->
    currentHover.element.find('.edit-task-form').hide()
    currentHover.element.find('.all-list-data').show()
  )

  $('#goal-list').hoverIntent( ->
    $('.sub-menu').toggle(240))
 
