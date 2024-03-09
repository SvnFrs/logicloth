$(document).ready(function () {
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
            url: '/FoodWeb/Cart/UpdateCartQuantity',  // The URL of your servlet/controller
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
});
