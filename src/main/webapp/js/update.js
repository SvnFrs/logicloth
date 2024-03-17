function updateProduct(productID) {
    // gather form field values
    var productName = document.getElementById('product-update-name-' + productID).value;
    var productPrice = document.getElementById('product-update-price-' + productID).value;
    var productQuantity = document.getElementById('product-update-quantity-' + productID).value;
    var productStatus = document.getElementById('product-update-status-' + productID).value;
    var productDescription = document.getElementById('product-update-description-' + productID).value;
    var productImage = document.getElementById('image-path').value;

    // build query string
    var queryString = '?productID=' + encodeURIComponent(productID) +
        '&productName=' + encodeURIComponent(productName) +
        '&productPrice=' + encodeURIComponent(productPrice) +
        '&productQuantity=' + encodeURIComponent(productQuantity) +
        '&status=' + encodeURIComponent(productStatus) +
        '&productDescription=' + encodeURIComponent(productDescription) +
        '&productImage=' + encodeURIComponent(productImage);

    var xhr = new XMLHttpRequest();
    xhr.open('POST', '/Seller/Product/Update' + queryString, true);
    xhr.onload = function () {
        if (xhr.status === 200) {
            console.log('Product updated successfully');
            window.location.reload();
        } else {
            console.log('Product update failed');
        }
    };
    xhr.send();
}

function updateRestaurant(restaurantID) {
    // gather form field values
    var restaurantName = document.getElementById('restaurant-update-name-' + restaurantID).value;
    var restaurantAddress = document.getElementById('restaurant-update-address-' + restaurantID).value;
    var restaurantStatus = document.getElementById('restaurant-update-status-' + restaurantID).value;
    var restaurantDescription = document.getElementById('restaurant-update-description-' + restaurantID).value;
    var restaurantImage = document.getElementById('restaurant-add-image-path').value;

    // build query string
    var queryString = '?restaurantID=' + encodeURIComponent(restaurantID) +
        '&restaurantName=' + encodeURIComponent(restaurantName) +
        '&restaurantAddress=' + encodeURIComponent(restaurantAddress) +
        '&restaurantStatus=' + encodeURIComponent(restaurantStatus) +
        '&restaurantDescription=' + encodeURIComponent(restaurantDescription) +
        '&restaurantImage=' + encodeURIComponent(restaurantImage);

    var xhr = new XMLHttpRequest();
    xhr.open('POST', '/Admin/Restaurant/Update' + queryString, true);
    xhr.onload = function () {
        if (xhr.status === 200) {
            console.log('Product updated successfully');
            window.location.reload();
        } else {
            console.log('Product update failed');
        }
    };
    xhr.send();
}


function updateOrderStatus(orderID) {
    // gather the selected order status
    var orderStatus = document.getElementById('order-status-' + orderID).value;

    // build query string
    var queryString = '?orderID=' + encodeURIComponent(orderID) +
        '&statusID=' + encodeURIComponent(orderStatus);

    var xhr = new XMLHttpRequest();
    xhr.open('POST', '/Seller/Order/Status' + queryString, true);
    xhr.onload = function () {
        if (xhr.status === 200) {
            console.log('Order status updated successfully');
            window.location.reload();
        } else {
            console.log('Order status update failed');
        }
    };
    xhr.send();
}

function updateUserInfo(userID) {
    // gather form field values
    var userName = document.getElementById('user-update-username-' + userID).value;
    var userEmail = document.getElementById('user-update-email-' + userID).value;
    var userStatus  = document.getElementById('user-update-status-' + userID).value;
    var userFullName = document.getElementById('user-update-fullName-' + userID).value;
    // var userRole = document.getElementById('user-update-role-' + userID).value;

    // build query string
    var queryString = '?userID=' + encodeURIComponent(userID) +
        '&userName=' + encodeURIComponent(userName) +
        '&userEmail=' + encodeURIComponent(userEmail) +
        '&userStatus=' + encodeURIComponent(userStatus) +
        '&userFullName=' + encodeURIComponent(userFullName);
        // '&userRole=' + encodeURIComponent(userRole);

    var xhr = new XMLHttpRequest();
    xhr.open('POST', '/Admin/User/Update' + queryString, true);
    xhr.onload = function () {
        if (xhr.status === 200) {
            console.log('User updated successfully');
            window.location.reload();
        } else {
            console.log('User update failed');
        }
    };
    xhr.send();
}