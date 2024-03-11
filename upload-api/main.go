package main

import (
	"io"
	"mime/multipart"
	"net/http"
	"os"
)

func main() {
	http.HandleFunc("/upload", func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Access-Control-Allow-Origin", "*")

		file, header, err := r.FormFile("file")
		if err != nil {
			http.Error(w, "Failed to read file", http.StatusBadRequest)
			return
		}
		defer func(file multipart.File) {
			err := file.Close()
			if err != nil {

			}
		}(file)

		out, err := os.Create("../src/main/webapp/images/foods/" + header.Filename)
		if err != nil {
			http.Error(w, "Failed to create file", http.StatusInternalServerError)
			return
		}
		defer out.Close()

		_, err = io.Copy(out, file)
		if err != nil {
			http.Error(w, "Failed to save file", http.StatusInternalServerError)
			return
		}

		// w.Write([]byte("File uploaded successfully"))
		// return uploaded file path
		_, err = w.Write([]byte("./images/foods/" + header.Filename))
		if err != nil {
			return 
		}
	})

	err := http.ListenAndServe(":3030", nil)
	if err != nil {
		return 
	}
}
