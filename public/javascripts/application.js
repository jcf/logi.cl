// Redirect = {
//   ticks: 5,
//   do_redirect: function() {
//     Redirect.ticks = undefined;
//     alert(REDIRECT_URL)
//   },
//   update_countdown: function(seconds) {
//     $('#countdown').text('You will be automatically redirected in ' + 
//       seconds + ' seconds');
//   },
//   tick: function() {
//     if(Redirect.ticks > 0 && Redirect.ticks != undefined) {
//       Redirect.update_countdown(Redirect.ticks)
//       Redirect.ticks -= 1
//       var timer = setInterval(Redirect.tick, 1000);
//     } else {
//       Redirect.do_redirect()
//     }
//   },
//   start_countdown: function() {
//     Redirect.tick()
//   }
// }

$(document).ready(function() {
  $("li#inline_contact_tab a").bind("click", function(e) {
    speed = e.shiftKey ? 1000 : 200
    $("#contact_form").slideToggle(speed, function() {
      if ($(this).is(':visible')) {
        $('#inline_contact_arrow_down').hide();
        $('#inline_contact_arrow_up').show();
      } else {
        $('#inline_contact_arrow_down').show();
        $('#inline_contact_arrow_up').hide();
      };
    });
    return false;
  });
  $("#cancel_button").bind("click", function() {
    if (confirm("Cancelling will discard any changes you have made to this form")) {
      location.href = "/";
    };
  });
  // $("#contact_form form").bind("submit", function() {
  //   $("#contact_submit").css("background", "#fff url(/images/loading.gif) no-repeat center center");
  //   $("#contact_submit").val("");
  //   $("#ajax_flash").hide();
  //   $.post("/messages/create", $("#contact_form form").serialize(), function(data) {
  //     $("#contact_submit").css("background", "#fff");
  //     $("#contact_submit").val("Send Message");
  //     $("#ajax_flash").replaceWith(data);
  //     $("#ajax_flash").slideDown(200);
  //     if ($("#ajax_flash").is(".success")) {
  //       $("#contact_form form")[0].reset();
  //     };
  //   });
  //   return false;
  // });
});
