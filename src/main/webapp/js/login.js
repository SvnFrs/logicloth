function CommonLogin() {
    var selectedRole = document.querySelector('input[name="role"]:checked');
    var loginName = document.getElementById('login-name').value;
    var loginPassword = document.getElementById('login-password').value;

    var xhr = new XMLHttpRequest();
    var url = '/FoodWeb/Login/' + selectedRole.value;
    xhr.open('POST', url, true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            if (xhr.status === 200) {
                var responseText = xhr.responseText;

                if (responseText === "User Login successfully") {
                    // Redirect to user.jsp or seller.jsp or other pages as needed
                    window.location.href = '/FoodWeb/user.jsp';
                } else if (responseText === "Seller Login successfully") {
                    // Redirect to seller.jsp or other pages as needed
                    window.location.href = '/FoodWeb/seller.jsp';
                } else {
                    // Handle login failure
                    alert("Login failed");
                }
            } else {
                // Handle other HTTP status codes
                alert("Error: " + xhr.status);
            }
        }
    };

    // Build the data string
    var data = 'login-name=' + encodeURIComponent(loginName) + '&login-password=' + encodeURIComponent(loginPassword);

    xhr.send(data);
}
