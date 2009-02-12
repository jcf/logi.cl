$(document).ready(function() {
  $("#contact_tab").bind("click", function(e) {
    speed = e.shiftKey ? 1000 : 200
    $("#contact_form").slideToggle(speed);
    return false;
  });
  $("#contact_form form").bind("submit", function() {
    $("#contact_submit").css("background", "#fff url(/images/loading.gif) no-repeat center center");
    $("#contact_submit").val("");
    $("#ajax_flash").hide();
    $.post("/contact/create", $("#contact_form form").serialize(), function(data) {
      $("#contact_submit").css("background", "#fff");
      $("#contact_submit").val("Send Message");
      $("#ajax_flash").replaceWith(data);
      $("#ajax_flash").slideDown(200);
      if ($("#ajax_flash").is(".success")) {
        $("#contact_form form")[0].reset();
      };
    });
    return false;
  });
});
