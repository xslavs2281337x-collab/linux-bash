FROM alpine:latest
WORKDIR /caller
COPY call.sh .
RUN chmod +x call.sh
RUN apk add --no-cache curl
CMD [ "./call.sh" ]