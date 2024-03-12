function cancelOrder(orderID) {
    var queryString = "?action=" + encodeURIComponent("cancel") + "&orderID=" + encodeURIComponent(orderID);
    $.ajax({
        url: "/FoodWeb/OrderStatus" + queryString,
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

function receivedOrder(orderID) {
    var queryString = "?action=" + encodeURIComponent("received") + "&orderID=" + encodeURIComponent(orderID);
    $.ajax({
        url: "/FoodWeb/OrderStatus" + queryString,
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