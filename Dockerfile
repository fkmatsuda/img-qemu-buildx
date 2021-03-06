FROM docker:20.10.17-dind-alpine3.16

ENV DOCKER_CLI_EXPERIMENTAL=enabled

COPY --from=docker/buildx-bin:0.8.2 /buildx /usr/libexec/docker/cli-plugins/docker-buildx
COPY scripts/install-buildx ./bin/

RUN apk --update --no-cache add openssh-client git

ENTRYPOINT [ "install-buildx" ] 