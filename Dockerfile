FROM python:3.9
RUN apt update -y
RUN curl -sSL https://install.python-poetry.org | python3 -
ENV PATH "${PATH}:/root/.local/bin"
RUN poetry --version

WORKDIR /code
COPY pyproject.toml poetry.lock poetry.toml ./app /code/
RUN poetry install

EXPOSE 8080:8080
CMD ["poetry", "run", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]

