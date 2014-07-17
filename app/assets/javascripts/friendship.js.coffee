# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->

  send_request = (url, data, success) ->

    data ?= {}

    $.ajax
      type: "POST"
      url: url
      data: data 
      success: success   

  $(".add-friend").click ->
    $link = $(this)
    friend = $link.attr 'id'

    send_request "/friendships",
        friendship:
          friend_id: friend
      ,
      ->
        $info = $link.parent("li").find("span")
        $info.show()
        $info.text("Friendship request sent")
        $link.hide()

    return false
  
  $(".confirm-friend").click ->
    $link = $(this)
    friend = $link.attr 'id'

    send_request "/friendships/" + friend,
       _method:'PUT'
      ,
      ->
        $info = $link.parent("li").find("span")
        $info.show()
        $info.text("Friendship approved")
        $link.hide()

    return false
  $(".destroy-friend").click ->
    $link = $(this)
    friend = $link.attr 'id'

    send_request "/friendships/" + friend,
       _method:'DELETE'
      ,
      ->
        $info = $link.parent("li").find("span")
        $info.show()
        $info.text("You are friends no more!")
        $link.hide()

    return false
    
