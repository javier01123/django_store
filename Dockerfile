FROM python:3.11.0-alpine3.16
# Ensure logging is up to date despite possible buffering
ENV PYTHONUNBUFFERED 1

WORKDIR /code

COPY requirements.txt .
COPY src/ .

#RUN pip install --upgrade pip
# RUN apk add --update --no-cache postgresql-client && \
#     apk add --update --no-cache --virtual .tmp-build \
#         build-base postgresql-dev musl-dev && \
#     apk del .tmp-build

RUN apk update && apk add postgresql-dev gcc python3-dev musl-dev

RUN pip install -r requirements.txt
RUN adduser --disabled-password --no-create-home django-user
USER django-user

EXPOSE 8000 
