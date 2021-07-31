FROM summerwind/actions-runner:latest
ENV PATH "$PATH:/opt/google-cloud-sdk/bin/:/opt/google-cloud-sdk/completion.bash.inc:/opt/google-cloud-sdk/path.bash.inc"
USER root

# Install glcoud command
RUN cd /opt && \
    curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-350.0.0-linux-x86_64.tar.gz && \
    tar -xvzf google-cloud-sdk-350.0.0-linux-x86_64.tar.gz && \
    ./google-cloud-sdk/install.sh -q && \
    chown -R runner:runner /home/runner

# Install gettext for envsubst and awscli
RUN apt-get update -y \
  && apt-get -y install gettext awscli

RUN rm -rf /var/lib/apt/lists/*

USER runner