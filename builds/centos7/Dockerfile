# Dockerfile for building image that contains software stack provisioned by Ansible.

FROM williamyeh/ansible:centos7-onbuild
MAINTAINER Chu-Siang Lai <chusiang@drx.tw>

RUN echo "===> Install necessary packages ..."  && \
      yum install -y curl git make

RUN echo "===> Get playbook ..."  && \
      git clone --depth=1 https://github.com/chusiang/vim-and-vi-mode.ansible.role.git ;\
      cd vim-and-vi-mode.ansible.role

ENV PLAYBOOK vim-and-vi-mode.ansible.role/provision.yml

RUN echo "===> Run playbook ..."  && \
      ansible-playbook-wrapper

RUN echo "===> Clean ..."  && \
      yum clean all

WORKDIR /srv

CMD [ "vim", "--version" ]
