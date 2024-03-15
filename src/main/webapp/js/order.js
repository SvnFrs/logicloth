function cancelOrder(orderID, restaurantID) {
    var queryString = "?action=" + encodeURIComponent("cancel") + "&orderID=" + encodeURIComponent(orderID) + "&restaurantID=" + encodeURIComponent(restaurantID);
    $.ajax({
        url: "/OrderStatus" + queryString,
        type: "POST",
        success: function(data) {
            console.log("Order cancelled successfully");
            window.location.reload();
        },
        error: function(error) {
            console.log("Order cancellation failed");
        }
    });
}

function receivedOrder(orderID, restaurantID) {
    console.log(restaurantID);
    var queryString = "?action=" + encodeURIComponent("received") + "&orderID=" + encodeURIComponent(orderID) + "&restaurantID=" + encodeURIComponent(restaurantID);
    $.ajax({
        url: "/OrderStatus" + queryString,
        type: "POST",
        success: function(data) {
            console.log("Order received successfully");
            window.location.reload();
        },
        error: function(error) {
            console.log("Order received failed");
        }
    });
}