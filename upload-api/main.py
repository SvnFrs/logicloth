from fastapi import FastAPI, UploadFile, File, HTTPException
from fastapi.middleware.cors import CORSMiddleware
import shutil
import os

app = FastAPI()

# Allowing CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Define upload endpoints for food and restaurant images
@app.post("/uploadFood/")
async def upload_food_image(file: UploadFile = File(...)):
    try:
        with open(f"./images/foods/{file.filename}", "wb") as buffer:
            shutil.copyfileobj(file.file, buffer)
    except Exception as e:
        raise HTTPException(status_code=500, detail="Failed to save file")
    
    return {"file_path": f"./images/foods/{file.filename}"}

@app.post("/uploadRestaurant/")
async def upload_restaurant_image(file: UploadFile = File(...)):
    try:
        with open(f"./images/restaurants/{file.filename}", "wb") as buffer:
            shutil.copyfileobj(file.file, buffer)
    except Exception as e:
        raise HTTPException(status_code=500, detail="Failed to save file")
    
    return {"file_path": f"./images/restaurants/{file.filename}"}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=3030)
