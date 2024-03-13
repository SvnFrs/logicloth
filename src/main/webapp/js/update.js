function updateProduct(productID) {
    // gather form field values
    var productName = document.getElementById('product-update-name-' + productID).value;
    var productPrice = document.getElementById('product-update-price-' + productID).value;
    var productQuantity = document.getElementById('product-update-quantity-' + productID).value;
    var productStatus = document.getElementById('product-update-status-' + productID).value;
    var productDescription = document.getElementById('product-update-description-' + productID).value;
    var productImage = document.getElementById('image-path-' + productID).value;

    // build query string
    var queryString = '?productID=' + encodeURIComponent(productID) +
        '&productName=' + encodeURIComponent(productName) +
        '&productPrice=' + encodeURIComponent(productPrice) +
        '&productQuantity=' + encodeURIComponent(productQuantity) +
        '&status=' + encodeURIComponent(productStatus) +
        '&productDescription=' + encodeURIComponent(productDescription) +
        '&productImage=' + encodeURIComponent(productImage);

    var xhr = new XMLHttpRequest();
    xhr.open('POST', '/FoodWeb/Seller/Product/Update' + queryString, true);
    xhr.onload = function () {
        if (xhr.status === 200) {
            console.log('Product updated successfully');
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
    var restaurantDescription = document.getElementById('restaurant-update-description-' + restaurantID).value;
    var restaurantImage = document.getElementById('restaurant-add-image-path').value;

    // build query string
    var queryString = '?restaurantID=' + encodeURIComponent(restaurantID) +
        '&restaurantName=' + encodeURIComponent(restaurantName) +
        '&restaurantAddress=' + encodeURIComponent(restaurantAddress) +
        '&restaurantDescription=' + encodeURIComponent(restaurantDescription) +
        '&restaurantImage=' + encodeURIComponent(restaurantImage);

    var xhr = new XMLHttpRequest();
    xhr.open('POST', '/FoodWeb/Admin/Restaurant/Update' + queryString, true);
    xhr.onload = function () {
        if (xhr.status === 200) {
            console.log('Product updated successfully');
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
    xhr.open('POST', '/FoodWeb/Seller/Order/Status' + queryString, true);
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
