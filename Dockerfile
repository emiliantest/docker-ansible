FROM ubuntu:trusty

ENV TERM=xterm-256color

RUN apt-get update -qy && \
    apt-get install -qy software-properties-common && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update -qy && \
    apt-get install -qy ansible

# Copy baked in playbooks
COPY ansible /ansible

VOLUME [ "/ansible" ]
WORKDIR /ansible

ENTRYPOINT ["ansible-playbook"]
CMD ["site.yml"]