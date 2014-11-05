# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
(($) ->

  $(".options-nav li a").click ->
    console.log "oh its clicked alirght"
    theParent = $(this).parent("li")
    if theParent.hasClass("active")
      theParent.removeClass("active")
    else
      theParent.addClass("active")

  $("#my-modal").bind "reveal:opened", ->
    timerBox = $("#my-modal")
    timerBox.css "width", $("body").width()
    return


) jQuery
