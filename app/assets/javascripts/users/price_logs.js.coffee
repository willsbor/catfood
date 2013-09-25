# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# <%= price_logs_path %>

selectProductPath = "1.js"

$(document).ready ->
  $("#product_info_select").change ->
    $.ajax selectProductPath,
        type: 'GET'
        dataType: 'script'
#        success: (data) -> $("#content").html(data)

   

