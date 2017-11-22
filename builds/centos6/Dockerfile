# Dockerfile for building image that contains software stack provisioned by Ansible.

# pull base image
FROM williamyeh/ansible:centos6-onbuild
MAINTAINER Chu-Siang Lai <chusiang.lai@gmail.com>

# init.
RUN yum install -y curl git make ;\
      git clone https://github.com/chusiang/vim-and-vi-mode.ansible.role.git ;\
      cd vim-and-vi-mode.ansible.role

# run.
ENV PLAYBOOK vim-and-vi-mode.ansible.role/provision.yml
RUN ansible-playbook-wrapper -vvv

# clean.
RUN yum clean all
