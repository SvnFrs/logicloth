function backToCart() {
    let xhr = new XMLHttpRequest();
    xhr.open("GET", "/FoodWeb/CheckoutCancel", true);
    xhr.send();
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            window.location.href = "/FoodWeb/Cart";
            // alert("Cancel checkout successfully");
        }
    }
}

// document.querySelector(".btn-primary").addEventListener("click", function(event) {
//     event.preventDefault();  // Prevent the form from being submitted normally
//
//     // Get the values from the inputs
//     var fullName = document.getElementById("fullName").value;
//     var phoneNumber = document.getElementById("phone-number").value;
//     var address = document.getElementById("address").value;
//     var saveInfo = document.getElementById("save-info").checked;
//     var cod = document.getElementById("cod").checked;
//
//     // Create the form data
//     var formData = new FormData();
//     formData.append("fullName", fullName);
//     formData.append("phoneNumber", phoneNumber);
//     formData.append("address", address);
//     formData.append("saveInfo", saveInfo);
//     formData.append("cod", cod);
//
//     // Send the POST request
//     fetch("/FoodWeb/Order", {
//         method: "POST",
//         body: formData
//     })
//         .then(response => response.text())
//         .then(data => console.log(data))
//         .catch(error => console.error("Error:", error));
// });

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
        var url = "/FoodWeb/Order?fullName=" + encodeURIComponent(fullName)
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
            },
            error: function(error) {
                console.error("Error:", error);
            }
        });
    });
});