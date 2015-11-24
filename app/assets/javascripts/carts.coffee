$ ->
  $("#b_delete_cart").click ->
    if confirm "Are you sure?"
      $.ajax
        type: "POST"
        url: $(this).attr('delete_cart_path')
        data: {"_method":"delete"}
        complete: (data) ->
          $("#table_and_buttons").html( "<h4>Ваше меню пусте.</h4>" )
