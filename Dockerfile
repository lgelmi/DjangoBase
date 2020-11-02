FROM python:3.7

RUN pip install poetry
RUN poetry config virtualenvs.create false

RUN mkdir /project
WORKDIR /project

COPY pyproject.toml poetry.lock /project/
RUN poetry install

COPY . /project/