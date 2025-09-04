FROM ubuntu:24.04

ARG DEFAULT_USER=ubuntu
ARG USERNAME=developer
ARG USER_UID=65535
ARG USER_GID=$USER_UID

RUN \
  groupmod \
  --new-name "${USERNAME}" \
  --gid "${USER_GID}" \
  "${DEFAULT_USER}" \
  && \
  usermod \
  --login "${USERNAME}" \
  --comment "Developer" \
  --move-home \
  --home "/home/${USERNAME}" \
  --uid "${USER_UID}" \
  --gid "${USER_GID}" \
  "${DEFAULT_USER}" \
  && \
  apt-get update \
  && \
  apt-get upgrade -y \
  && \
  apt-get install --no-install-suggests --no-install-recommends -y \
  apt-utils \
  build-essential \
  ca-certificates \
  ccache \
  clang \
  clang-format \
  clang-tidy \
  clangd \
  cmake \
  curl \
  git \
  libnss-wrapper \
  lldb \
  ninja-build \
  openjdk-21-jre-headless \
  && \
  rm -rf /var/lib/apt/lists

COPY nsswrapper.sh /usr/bin/

USER $USERNAME

ENTRYPOINT ["/usr/bin/nsswrapper.sh"]