document.getElementById('uploadForm').addEventListener('submit', function(event) {
    event.preventDefault();

    var xhr = new XMLHttpRequest();
    var fileInput = document.getElementById('fileInput');
    var file = fileInput.files[0];
    var formData = new FormData();

    formData.append('file', file);

    xhr.open('POST', 'http://localhost:3030/upload', true);
    xhr.onload = function () {
        if (xhr.status === 200) {
            console.log('File uploaded successfully');
        } else {
            console.log('File upload failed');
        }
    };
    xhr.send(formData);
});