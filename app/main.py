from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def home():
    return {"message": "Hello, FastAPI with Docker and GitHub Actions! from Raghav Agarwal"}
