$(document).ready(function() {

  // define function that gets price data in json format
  $('#tweets').click(function() {
    function getTweets() {
      $.ajax({
        type: "POST",
        dataType: "json",
        url: "/tweets",
        complete: function(data) {
          var tweets = JSON.parse(data.responseText);
          // probably need to iterate thru each tweet and add to the table in that manner
          $('#tweets').prepend(tweets);
          setTimeout(getTweets, 1000);
        }
      });
    }
    getTweets();
  });

});