document.getElementById('restaurant-add-image').addEventListener('submit', function(event) {
    event.preventDefault();

    var xhr = new XMLHttpRequest();
    var fileInput = document.getElementById('restaurant-add-file');
    var file = fileInput.files[0];
    var formData = new FormData();

    formData.append('file', file);

    xhr.open('POST', 'http://localhost:3030/upload', true);
    xhr.onload = function () {
        if (xhr.status === 200) {
            console.log('File uploaded successfully');

            var imagePath = xhr.responseText;
            document.getElementById('restaurant-add-image-path').value = imagePath;
        } else {
            console.log('File upload failed');
        }
    };
    xhr.send(formData);
});