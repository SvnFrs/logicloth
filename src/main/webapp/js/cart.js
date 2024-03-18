$(document).ready(function () {

    $('#select-all-products').click(function() {
        $('input[name="productChooser"]').prop('checked', $(this).prop('checked'));
        // Trigger change event to update total when checkboxes are checked
        $('input[name="productChooser"]').change();
    });
    // Enable the minus and plus buttons
    // $('.btn-minus, .btn-plus').prop('disabled', false);

    // Handle the minus button click
    $('.btn-minus').click(function () {
        var id = $(this).attr('id').split('-')[2];  // Get the product ID from the button's id
        var quantityInput = $('#quantity-' + id);  // Get the quantity input element
        var quantity = parseInt(quantityInput.val());  // Get the current quantity

        if (quantity > 1) {  // If the quantity is more than 1
            quantity--;  // Decrease the quantity
            quantityInput.val(quantity);  // Update the quantity input
            updateQuantity(id, quantity);  // Send the request to update the quantity in the database
        }
    });

    // Handle the plus button click
    $('.btn-plus').click(function () {
        var id = $(this).attr('id').split('-')[2];  // Get the product ID from the button's id
        var quantityInput = $('#quantity-' + id);  // Get the quantity input element
        var maxQuantityInput = $('#' + id + '-max-quantity');  // Get the max quantity input element
        var quantity = parseInt(quantityInput.val());  // Get the current quantity
        var maxQuantity = parseInt(maxQuantityInput.val());  // Get the max quantity

        if (quantity < maxQuantity) {  // If the quantity is less than the max quantity
            quantity++;  // Increase the quantity
            quantityInput.val(quantity);  // Update the quantity input
            updateQuantity(id, quantity);  // Send the request to update the quantity in the database
        }
    });

    // Function to send an AJAX request to update the quantity in the database
    function updateQuantity(productId, quantity) {
        $.ajax({
            url: '/Cart/UpdateCartQuantity',  // The URL of your servlet/controller
            method: 'GET',
            data: {
                productID: productId,
                quantity: quantity
            },
            success: function (response) {
                // Update the subtotal when the request is successful
                var price = parseInt($('#price-' + productId).text());
                $('#subtotal-' + productId).val((price * quantity));
            },
            error: function (jqXHR, textStatus, errorThrown) {
                // Handle any errors here
                console.error('Error updating quantity:', textStatus, errorThrown);
            }
        });
    }
    $('input[name="productChooser"]').change(function() {
        var total = 0;  // Initialize the total

        // Iterate over each checked checkbox
        $('input[name="productChooser"]:checked').each(function() {
            var id = $(this).attr('id').split('-')[1];  // Get the product ID from the checkbox's id
            var subtotalInput = $('#subtotal-' + id);  // Get the subtotal input element
            var subtotal = parseInt(subtotalInput.val());  // Get the subtotal

            total += subtotal;  // Add the subtotal to the total
        });

        // Update the total
        $('#total').text('Total: ' + total);
    });

    // Handle the 'Checkout' button click
    $('#checkout-button').click(function(e) {
        e.preventDefault();  // Prevent the default action

        var products = [];  // Initialize an array to hold the selected products

        // Iterate over each checked checkbox
        $('input[name="productChooser"]:checked').each(function() {
            var id = $(this).attr('id').split('-')[1];  // Get the product ID from the checkbox's id
            var quantityInput = $('#quantity-' + id);  // Get the quantity input element
            var quantity = parseInt(quantityInput.val());  // Get the quantity
            console.log(quantity);

            // Add the product to the array
            products.push({
                productID: id,
                quantity: quantity
            });
        });

        // Send the array of products to the 'Checkout' controller using AJAX
        $.ajax({
            url: '/Checkout',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(products),
            success: function(response) {
                alert(response.message);
                // You can also redirect the user to another page here
                window.location.href = '/Checkout';
            },
            error: function(jqXHR, textStatus, errorThrown) {
                alert('An error occurred: ' + textStatus);
            }
        });
    });

    // Handle the 'Remove' button click
    $('.btn-remove').click(function() {
        var id = $(this).attr('id').split('-')[1];  // Get the product ID from the button's id

        // Send the product ID to the 'RemoveFromCart' controller using AJAX
        $.ajax({
            url: '/Cart/RemoveFromCart',
            type: 'GET',
            data: {
                productID: id
            },
            success: function(response) {
                // Remove the product from the cart when the request is successful
                $('#product-' + id).remove();
                // refresh the page
                location.reload();
            },
            error: function(jqXHR, textStatus, errorThrown) {
                // Handle any errors here
                console.error('Error removing product:', textStatus, errorThrown);
            }
        });
    });
});
