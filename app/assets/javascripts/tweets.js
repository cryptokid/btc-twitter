$(document).ready(function() {

  // define function that gets price data in json format
    function getTweets() {
      $.ajax({
        type: "POST",
        // need to POST the query term param
        dataType: "json",
        url: "/new",
        data: null,
        success: function(data) {
          alert("You got a succesful response from your application");
        }
      });
    }
    getPrices();
  // });

});