# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# <%= price_logs_path %>
#        success: (data) -> $('#content').html(data)



$(document).ready ->
  $('#price_log_product_info_id').change ->
    # get select value
    index = $('#price_log_product_info_id').val()
    selectProductPath = index + "/product_info_logs.js"

    if index isnt ''
      $.ajax selectProductPath,
        type: 'GET'
        dataType: 'script'
    else 
      $('#price_log_info_content').css({ display: 'none' })

   

