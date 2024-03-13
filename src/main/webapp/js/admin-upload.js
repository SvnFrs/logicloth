document.getElementById('restaurant-update-image').addEventListener('submit', function(event) {
    event.preventDefault();

    var xhr = new XMLHttpRequest();
    var fileInput = document.getElementById('restaurant-update-file');
    var file = fileInput.files[0];
    var formData = new FormData();

    formData.append('file', file);

    xhr.open('POST', 'http://localhost:3030/uploadRestaurant', true);
    xhr.onload = function () {
        if (xhr.status === 200) {
            console.log('File uploaded successfully');

            var imagePath = xhr.responseText;
            document.getElementById('restaurant-update-image-path').value = imagePath;
        } else {
            console.log('File upload failed');
        }
    };
    xhr.send(formData);
});