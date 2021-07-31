FROM summerwind/actions-runner-dind:latest
WORKDIR /
SAVE IMAGE quay.io/guiadco/github-action-runner:latest
ENV PATH "$PATH:/opt/google-cloud-sdk/bin/"

all:
    BUILD +glcoud
    BUILD +docker

glcoud:
    ENV PATH "$PATH:/opt/google-cloud-sdk/bin/"
    USER root

    # Install glcoud command
    RUN cd /opt && \
        curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-350.0.0-linux-x86_64.tar.gz && \
        tar -xvzf google-cloud-sdk-350.0.0-linux-x86_64.tar.gz && \
        ./google-cloud-sdk/install.sh -q

    RUN rm -rf /var/lib/apt/lists/*

    USER runner

docker:
    # Install gettext for envsubst and awscli
    RUN sudo apt-get update -y \
    && sudo apt-get -y install gettext awscli

