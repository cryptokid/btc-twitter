$(document).ready(function() {

  // define function that gets price data in json format
  function getPrices() {
    $.ajax({
      type: "GET",
      dataType: "json",
      url: "/bitcoin",
      complete: function(data) {
        var prices = JSON.parse(data.responseText);
        $('#sell_price').text(prices.sell);
        $('#buy_price').text(prices.buy);
        setTimeout(getPrices, 30000);
        // now prices should refresh every 30 seconds
      }
    });
  }
  getPrices();
});