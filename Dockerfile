FROM jenkins/jenkins:lts

USER root
RUN apt-get update && \
    apt-get install -y python3 python3-venv python3-pip bats && \
    mkdir -p /home/jenkins/venv && \
    chown -R jenkins:jenkins /home/jenkins/venv

USER jenkins
RUN python3 -m venv /home/jenkins/venv

ENV PATH="/home/jenkins/venv/bin:$PATH"

RUN pip install --upgrade pip
