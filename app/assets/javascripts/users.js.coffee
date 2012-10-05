# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$.fn.serializeObject = ->
  o = {}
  a = @serializeArray()
  $.each a, ->
    if o[@name] isnt `undefined`
      o[@name] = [o[@name]]  unless o[@name].push
      o[@name].push @value or ""
    else
      o[@name] = @value or ""
  o

$(() ->
  $("form").submit((e)->
    e.preventDefault
    userData = $(this).serializeObject()
    that = this
    $.ajax(
      type: 'POST',
      url: $(this).attr("action")
      data: userData,
      success: (html) ->
        $(that).html(html)
      error: (e, html) ->
        $(that).html(html)
    )
    return false
  )
)
