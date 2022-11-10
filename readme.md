# 10th Planet

## Simple Start
```shell
make build
docker run -d -p 8080:8080 063985724809.dkr.ecr.us-east-1.amazonaws.com/10thplanet:latest # --name 10p
curl http://0.0.0.0:8080
# {"message":"Welcome to the 10th planet!"}%  

curl http://0.0.0.0:8080/items/1
# {"item_id":1,"q":null}
```

#### Development Setup

Install [poetry](https://python-poetry.org/), then install dependencies:
```shell
poetry install
```

#### Run black

[black](https://github.com/psf/black) is the uncompromising Python code formatter. This **will** format your code:
```shell
poetry run black .
```

#### Run mypy

[mypy](https://mypy.readthedocs.io/en/stable/index.html) is a static type checker for Python, run it by doing:
```shell
poetry run mypy .
```


#### Docker fun: check out the makefile!