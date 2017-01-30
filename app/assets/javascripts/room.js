$(document).ready(function() {
  $('form#new_post').on('submit', function(event) {
    event.preventDefault();

    $.ajax({
      data: $(this).serialize(),
      success: function() {
        var post_body = $("#post_body")[0].value;
        var username = $("#post_username")[0].value;
        $('#posts').append("<li>" + post_body + " (" + username + ")"+ "</li>");
        $("form").trigger("reset");
      },
      error: function(request, errorType, errorMessage) {
        console.log('Error' + errorType + ' with message: ' + errorMessage);
      }
    });
  });
});
