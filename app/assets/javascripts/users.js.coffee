# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$.fn.serializeObject = ->
  obj = {}
  arr = @serializeArray()
  $.each arr, ->
    if obj[@name]?
      obj[@name] = [obj[@name]] unless obj[@name].push
      obj[@name].push @value or ""
    else
      obj[@name] = @value or ""
  return obj

$ ->
  $("#main-content").delegate 'form', 'submit', (e) ->
    e.preventDefault()
    userData = $(this).serializeObject()
    $.ajax
      type: 'POST'
      url: $(this).attr("action")
      data: userData
      success: (html) =>
        container = $(this)
        # Bit of a hack
        if html.match(/\<form/)
          container = $(container).parent()
        else
          $(container).parent().find("p.error").remove()
        $(container).html(html)
      error: (e, html) =>
        $(this).parent().html(html)
    return false

  $("#main-content").on 'click', '.back-button', (e) ->
    $(this).parent().hide().prev().removeClass('hidden')
    return false

  $("#signup-trigger").focus ->
    # Copy the existing form on the page to where the user clicked
    if !$.trim( $('#new-form-container').html() ).length 
      $("#new-form-container").html($("form#new_user").clone())
      # Remove the original form
      $("#main-content > form#new_user").remove()

    # Show the new form
    $("#dummy-form").hide()
    $("#new-form-container").show()
    $("#new-form-container #user_email").focus()

  # Hide the signup form on click outside it
  $("body").click (e) ->
    if $(e.target).closest('#new-form-container').length == 0 
      $("#dummy-form").show()
      $("#new-form-container").hide()
