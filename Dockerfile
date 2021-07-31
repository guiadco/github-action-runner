FROM summerwind/actions-runner:latest

RUN sudo apt-get update -y \
  && sudo apt-get -y install gettext awscli

ENV PATH "$PATH:/opt/google-cloud-sdk/bin/"

RUN cd /tmp && \
    curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-350.0.0-linux-x86_64.tar.gz && \
    tar -xvzf google-cloud-sdk-350.0.0-linux-x86_64.tar.gz && \
    ./google-cloud-sdk/install.sh -q --command-completion && \
    sudo apt-get update -qqy && \
    sudo apt-get install -qqy google-cloud-sdk

RUN sudo rm -rf /var/lib/apt/lists/*