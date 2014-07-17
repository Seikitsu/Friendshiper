# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(".add-friend").click ->
    $.ajax({
      type: "POST",
      url: "/friendships",
      data: { friendship: { user_id: 1, friend_id: 3 } },
      success:(data) ->
        alert "Sent"
        return false
      error:(data) ->
        return false
    })
