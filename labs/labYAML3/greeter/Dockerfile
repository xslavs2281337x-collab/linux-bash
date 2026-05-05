FROM python:3.12-alpine
WORKDIR /greeter
RUN apk add --no-cache wget
COPY greet.py .
CMD [ "python", "greet.py" ]