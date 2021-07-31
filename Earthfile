FROM summerwind/actions-runner:latest
WORKDIR /
SAVE IMAGE quay.io/guiadco/github-action-runner

docker:
    RUN cd /tmp && \
        curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-350.0.0-linux-x86_64.tar.gz && \
        tar -xvzf google-cloud-sdk-350.0.0-linux-x86_64.tar.gz && \
        ./google-cloud-sdk/install.sh
    RUN sudo apt-get update -y
    RUN sudo apt-get -y install gettext awscli
