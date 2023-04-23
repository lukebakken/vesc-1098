# syntax=docker/dockerfile:1
FROM python:3-alpine
WORKDIR /app
ENV PYTHON_RUNNING_IN_CONTAINER=true
RUN python -m pip install --upgrade pip pipenv
COPY manage.py .
COPY Pipfile* .
COPY rabbitmq_auth_backend_django/ rabbitmq_auth_backend_django/
RUN pipenv install
RUN pipenv run migrate
EXPOSE 8000
ENTRYPOINT ["pipenv", "run", "runserver"]
