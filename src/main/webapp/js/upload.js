// Loop through all forms with id starting with 'uploadForm-'
document.querySelectorAll('[id^="uploadForm-"]').forEach((form) => {
    form.addEventListener('submit', function(event) {
        event.preventDefault();

        var xhr = new XMLHttpRequest();
        var productID = this.id.split('-')[1]; // Get productID from form ID
        var fileInput = document.getElementById('fileInput-' + productID);
        var file = fileInput.files[0];
        var formData = new FormData();

        formData.append('file', file);

        xhr.open('POST', 'http://localhost:3030/upload', true);
        xhr.onload = function () {
            if (xhr.status === 200) {
                console.log('File uploaded successfully');

                var imagePath = xhr.responseText;
                document.getElementById('image-path-' + productID).value = imagePath;
            } else {
                console.log('File upload failed');
            }
        };
        xhr.send(formData);
    });
});


document.getElementById('product-add-image').addEventListener('submit', function(event) {
    event.preventDefault();

    var xhr = new XMLHttpRequest();
    var fileInput = document.getElementById('product-add-file');
    var file = fileInput.files[0];
    var formData = new FormData();

    formData.append('file', file);

    xhr.open('POST', 'http://localhost:3030/upload', true);
    xhr.onload = function () {
        if (xhr.status === 200) {
            console.log('File uploaded successfully');

            var imagePath = xhr.responseText;
            document.getElementById('product-add-image-path').value = imagePath;
        } else {
            console.log('File upload failed');
        }
    };
    xhr.send(formData);
});