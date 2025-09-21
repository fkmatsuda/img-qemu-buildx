FROM docker:27.5.1-dind-rootless

ENV DOCKER_CLI_EXPERIMENTAL=enabled

COPY --from=docker/buildx-bin:0.17.1 /buildx /usr/libexec/docker/cli-plugins/docker-buildx
COPY scripts/install-buildx ./bin/

USER root
RUN apk --update --no-cache add openssh-client git
USER rootless

ENTRYPOINT [ "install-buildx" ]