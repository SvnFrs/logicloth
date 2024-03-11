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
    xhr.open('POST', '/FoodWeb/Seller/Product/Add' + queryString, true);
    xhr.onload = function () {
        if (xhr.status === 200) {
            console.log('Product added successfully');
        } else {
            console.log('Product add failed');
        }
    };
    xhr.send();
}
