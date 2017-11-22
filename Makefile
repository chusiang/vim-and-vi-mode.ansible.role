.PHONY: main init syntax_check lint_check up run clean_roles clean

main: syntax_check lint_check

init:
	ansible-galaxy install -f -p roles -r requirements.yml
	if [ ! -d "/tmp/ansible-retry" ]; then mkdir "/tmp/ansible-retry"; fi

syntax_check:
	ansible-playbook --syntax-check provision.yml

lint_check:
	ansible-lint provision.yml

up:
	vagrant up

run:
	ansible-playbook provision.yml -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory

clean_roles:
	-rm -rf roles/

clean: clean_roles
	-rm -f *.retry
	vagrant destroy -f
