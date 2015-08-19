$ ->
  $(".showMore").on "click", (ev) ->
    $(".menu").toggle();
    $(this).hide();
    $(".showLess").show();

  $(".showLess").click (ev) ->
    $(".menu").toggle();
    $(".showMore").show();
    $(this).hide();