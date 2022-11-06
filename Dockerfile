FROM python:3.11.0-alpine3.16
# Ensure logging is up to date despite possible buffering
ENV PYTHONUNBUFFERED 1

WORKDIR /code

COPY requirements.txt .
COPY src/ .

#RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN adduser --disabled-password --no-create-home django-user
USER django-user

EXPOSE 8000 
