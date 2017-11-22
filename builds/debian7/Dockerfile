# Dockerfile for building image that contains software stack provisioned by Ansible.

# pull base image
FROM williamyeh/ansible:debian7-onbuild
MAINTAINER Chu-Siang Lai <chusiang.lai@gmail.com>

# init.
#
# fix policy-rc.d for Docker
# @see http://www.monblocnotes.com/node/2057
# @see http://askubuntu.com/a/365912
RUN sed -i -e 's/exit\s\s*101/exit 0/' /usr/sbin/policy-rc.d

RUN apt-get install -y curl git make ;\
      git clone https://github.com/chusiang/vim-and-vi-mode.ansible.role.git ;\
      cd vim-and-vi-mode.ansible.role

# run.
ENV PLAYBOOK vim-and-vi-mode.ansible.role/provision.yml
RUN ansible-playbook-wrapper -vvv

# clean.
RUN apt-get clean
