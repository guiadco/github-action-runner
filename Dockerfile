FROM summerwind/actions-runner:latest
# ENV PATH "$PATH:~/google-cloud-sdk/bin/:~/google-cloud-sdk/completion.bash.inc:~/google-cloud-sdk/path.bash.inc"

# # Install glcoud command
# RUN cd ~ && \
#     curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-350.0.0-linux-x86_64.tar.gz && \
#     tar -xvzf google-cloud-sdk-350.0.0-linux-x86_64.tar.gz && \
#     ./google-cloud-sdk/install.sh -q

# Install Google Cloud SDK
RUN sudo apt-get -q update && \
    sudo apt-get install -yq apt-transport-https ca-certificates gnupg && \
    echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl -sSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add - && \
    sudo apt-get -q update && \
    sudo apt-get install -yq google-cloud-sdk && \
    sudo rm -rf /var/lib/apt/lists/*

# Install gettext for envsubst and awscli
RUN sudo apt-get update -y \
  && sudo apt-get -y install gettext awscli

# # Install terraform
# RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add - && \
#     sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
#     sudo apt-get -y install terraform


# RUN sudo rm -rf /var/lib/apt/lists/* && \
#     rm ~/google-cloud-sdk-350.0.0-linux-x86_64.tar.gz
