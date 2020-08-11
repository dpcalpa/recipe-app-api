# Base image: python 3.7 alpine
FROM python:3.7-alpine

# Python unbuffered environment variable
# To tell python to run in unbuffered mode
# Recommended for running it in Docker containers
ENV PYTHONUNBUFFERED 1

# Store dependencies from local directory to container directory
COPY ./requirements.txt /requirements.txt 
RUN pip install -r /requirements.txt

# Directory within the image to store app source code
# Makes that directory the working directory and copies the content
RUN mkdir /app
WORKDIR /app
COPY ./app /app

# Create user that will run app using Docker
# -D: for running applications only
# And switch to the new created user.
# For security purposes: don't use root user.
RUN adduser -D user
USER user