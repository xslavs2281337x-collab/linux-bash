FROM alpine
RUN apk add --no-cache curl
WORKDIR /client
COPY  ping.sh .
RUN chmod -x ping.sh
CMD [ "/.ping.sh" ]