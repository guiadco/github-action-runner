FROM summerwind/actions-runner:latest

RUN sudo apt update -y \
  && sudo apt -y install gettext  awscli \
  && sudo rm -rf /var/lib/apt/lists/*