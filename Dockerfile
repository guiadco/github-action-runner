FROM summerwind/actions-runner:latest

RUN sudo apt update -y \
  && sudo apt -y install gettext  awscli \

RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list \
  && sudo apt-get install -y apt-transport-https ca-certificates gnupg \ 
  && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add - \
  && sudo apt-get update -y && sudo apt-get install -y google-cloud-sdk


RUN sudo rm -rf /var/lib/apt/lists/*