# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
    $('#datetime_picker_input_started_at').datetimepicker format: 'YYYY/MM/DD'
    $('#datetime_picker_input_ended_at').datetimepicker format: 'YYYY/MM/DD'
    return

$ ->
  ready()
  return

document.addEventListener 'turbolinks:load', ->
  ready()
  return
