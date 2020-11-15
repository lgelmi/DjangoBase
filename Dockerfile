FROM python:3.7

RUN apt-get update && apt-get install -y netcat

RUN pip install poetry
RUN poetry config virtualenvs.create false

RUN mkdir /project
WORKDIR /project
COPY . /project/
RUN poetry install

# run entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]