$ ->
  $(".showLess").click (ev) ->
    $(".menu").toggle();
    $(".showMore").show();
    $(this).hide();

  $(".showMore").on "click", (ev) ->
    $(".menu").toggle();
    $(".showMore").hide();
    $(".showLess").show();
