$(document).ready(function() {

  // define function that gets price data in json format
  function getTweets() {
    $.ajax({
      type: "GET",
      dataType: "json",
      url: "/tweets",
      complete: function(data) {
        var tweets = data.responseJSON;
        // probably need to iterate thru each tweet and add to the table in that manner
        for(i = 0; i < tweets.length; i++){
          tweet = "<tr><td>" + tweets[i].user + "</td><td>" + tweets[i].body + "</td><td>" + tweets[i].sentiment + "</td><td>" + tweets[i].tweeted_at + "</td></tr>";
          $("#tweets tr:first").after(tweet);
        }
        setTimeout(getTweets, 10000);
      }
    });
  }
  getTweets();
});