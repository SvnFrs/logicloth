function addProduct() {
    // gather the values of the form fields
    var productName = document.getElementById('product-add-name').value;
    var productPrice = document.getElementById('product-add-price').value;
    var productQuantity = document.getElementById('product-add-quantity').value;
    var productDescription = document.getElementById('product-add-description').value;
    var productImage = document.getElementById('product-add-image-path').value;

    // build query string
    var queryString = '?productName=' + encodeURIComponent(productName) +
        '&productPrice=' + encodeURIComponent(productPrice) +
        '&productQuantity=' + encodeURIComponent(productQuantity) +
        '&productDescription=' + encodeURIComponent(productDescription) +
        '&productImage=' + encodeURIComponent(productImage);

    var xhr = new XMLHttpRequest();
    xhr.open('POST', '/Seller/Product/Add' + queryString, true);
    xhr.onload = function () {
        if (xhr.status === 200) {
            console.log('Product added successfully');
        } else {
            console.log('Product add failed');
        }
    };
    xhr.send();
}

function addRestaurant() {
    // gather the values of the form fields
    var restaurantName = document.getElementById('restaurant-add-name').value;
    var restaurantOwner = document.getElementById('restaurant-add-owner').value;
    var restaurantAddress = document.getElementById('restaurant-add-address').value;
    var restaurantDescription = document.getElementById('restaurant-add-description').value;
    var restaurantImage = document.getElementById('restaurant-add-image-path').value;

    // build query string
    var queryString = '?restaurantName=' + encodeURIComponent(restaurantName) +
        '&restaurantOwner=' + encodeURIComponent(restaurantOwner) +
        '&restaurantAddress=' + encodeURIComponent(restaurantAddress) +
        '&restaurantDescription=' + encodeURIComponent(restaurantDescription) +
        '&restaurantImage=' + encodeURIComponent(restaurantImage);

    var xhr = new XMLHttpRequest();
    xhr.open('POST', '/Admin/Restaurant/Add' + queryString, true);
    xhr.onload = function () {
        if (xhr.status === 200) {
            console.log('Restaurant added successfully');
        } else {
            console.log('Restaurant add failed');
        }
    };
    xhr.send();
}

function addUser() {
    // gather the values of the form fields
    var userName = document.getElementById('user-add-username').value;
    // var role = document.querySelector('input[name="role"]:checked').value;
    var roleElement = document.getElementById('user-add-role');
    var role = roleElement.value;
    var userEmail = document.getElementById('user-add-email').value;
    var userFullName = document.getElementById('user-add-fullName').value;

    // build query string
    var queryString = '?userName=' + encodeURIComponent(userName) +
        '&role=' + encodeURIComponent(role) +
        '&userEmail=' + encodeURIComponent(userEmail) +
        '&userFullName=' + encodeURIComponent(userFullName);

    var xhr = new XMLHttpRequest();
    xhr.open('POST', '/FoodWeb/Admin/User/Add' + queryString, true);
    xhr.onload = function () {
        if (xhr.status === 200) {
            console.log('User added successfully');
        } else {
            console.log('User add failed');
        }
    };
    xhr.send();
}