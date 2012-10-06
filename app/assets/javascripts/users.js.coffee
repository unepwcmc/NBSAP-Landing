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
  $("#main-content").delegate('form', 'submit',(e)->
    e.preventDefault
    userData = $(this).serializeObject()
    that = this
    $.ajax(
      type: 'POST',
      url: $(this).attr("action")
      data: userData,
      success: (html) ->
        container = $(that)
        # Bit of a hack
        if html.match(/\<form/)
          container = $(container).parent()
        else
          $(container).parent().find("p.error").remove()

        $(container).html(html)
      error: (e, html) ->
        $(that).parent().html(html)
    )
    return false
  )

  $("#signup-trigger").focus(() ->
    # Copy the existing form on the page to where the user clicked
    $("#new-form-container").html($("form#new_user").clone())
    # Remove the original form
    $("#main-content > form#new_user").remove()

    # Show the new form
    $("#dummy-form").hide()
    $("#new-form-container").show()
    $("#new-form-container #user_email").focus()
  )

  # Hide the signup form on click outside it
  $("body").click((e) ->
    if $(e.target).closest('#new-form-container').length == 0 
      $("#dummy-form").show()
      $("#new-form-container").hide()
  )
)
