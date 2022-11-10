import uvicorn

from fastapi import FastAPI
from fastapi.routing import APIRoute

from routers import hello


app = FastAPI()

app.include_router(hello.router)


@app.get("/")
async def welcome() -> dict:
    return {"message": "Welcome to the 10th planet!"}


@app.get("/hello")
async def hello() -> dict:
    return {"message": "hello new world"}


if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8080)
