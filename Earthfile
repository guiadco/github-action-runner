FROM summerwind/actions-runner-dind:latest
WORKDIR /
SAVE IMAGE quay.io/guiadco/github-action-runner:latest
ENV PATH "$PATH:~/google-cloud-sdk/bin/:~/google-cloud-sdk/completion.bash.inc:~/google-cloud-sdk/path.bash.inc"

all:
    BUILD +docker

docker:
    FROM summerwind/actions-runner-dind:latest
    ENV PATH "$PATH:~/google-cloud-sdk/bin/:~/google-cloud-sdk/completion.bash.inc:~/google-cloud-sdk/path.bash.inc"

    # Install glcoud command
    RUN cd ~ && \
        curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-350.0.0-linux-x86_64.tar.gz && \
        tar -xvzf google-cloud-sdk-350.0.0-linux-x86_64.tar.gz && \
        ./google-cloud-sdk/install.sh -q

    # Install gettext for envsubst and awscli
    RUN sudo apt-get update -y \
    && sudo apt-get -y install gettext awscli

    # Install terraform
    RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add - && \
        sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
        sudo apt-get -y install terraform


    RUN sudo rm -rf /var/lib/apt/lists/* && \
        rm ~/google-cloud-sdk-350.0.0-linux-x86_64.tar.gz
