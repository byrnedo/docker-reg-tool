FROM alpine:3.8

RUN apk add --no-cache curl bash jq

COPY ./docker_reg_tool /

ENTRYPOINT ["/docker_reg_tool"]
