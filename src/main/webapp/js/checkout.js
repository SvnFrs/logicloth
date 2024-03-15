function backToCart() {
    let xhr = new XMLHttpRequest();
    xhr.open("GET", "/CheckoutCancel", true);
    xhr.send();
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            window.location.href = "/Cart";
            // alert("Cancel checkout successfully");
        }
    }
}
$(document).ready(function() {
    $(".btn-primary").click(function(event) {
        event.preventDefault();  // Prevent the form from being submitted normally

        // Get the values from the inputs
        var fullName = $("#fullName").val();
        var phoneNumber = $("#phone-number").val();
        var address = $("#address").val();
        var saveInfo = $("#save-info").is(":checked");
        var cod = $("#cod").is(":checked");

        // Create the URL with the form data
        var url = "/Order?fullName=" + encodeURIComponent(fullName)
            + "&phoneNumber=" + encodeURIComponent(phoneNumber)
            + "&address=" + encodeURIComponent(address)
            + "&saveInfo=" + encodeURIComponent(saveInfo)
            + "&cod=" + encodeURIComponent(cod);

        // Send the GET request
        $.ajax({
            url: url,
            type: "POST",
            success: function(data) {
                console.log(data);
                window.location.href = "/Order";
            },
            error: function(error) {
                console.error("Error:", error);
            }
        });
    });
});