# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'page:change', ->
	$("#click").click ->
	  $("html, body").animate
	    scrollTop: $(".well").offset().top
	  , 500
	$('#searchLink').click ->
	  $('#center_search').slideToggle()


