## How it Works

There is ansible inventory which identifies all components to deployed an OpenShift cluster on AWS/GovCloud.

Currently, the following components are included in this inventory:
* None yet

## Prerequisites

* [Ansible](http://docs.ansible.com/ansible/latest/intro_installation.html)
* [OpenShift CLI Tools](https://docs.openshift.com/container-platform/3.7/cli_reference/get_started_cli.html)
* Access to the AWS/GovCloud account

## Usage 

1. Clone this repository
1. Available parameters to use the AWS provision can be found in the Role's README
1. A Key-pair in AWS
1. Modify 'regions' entry (line 13) in the inventory 'ec2.ini' file to match the 'aws_region' variable in your inventory
1. Modify 'instance_filters' entry (line 14) in the inventory 'ec2.ini' file to match the 'env_id' variable in your inventory's all.yml
1. Install the required [casl-ansible](https://github.com/redhat-cop/casl-ansible) dependency
    1. `[labs-ci-cd]$ ansible-galaxy install -r requirements.yml --roles-path=roles`
1. Edit ~/src/casl-ansible/inventory/sample.aws.example.com.d/inventory/group_vars/all.yml to match your AWS environment. See comments in the file for more detailed information on how to fill these in.
1. Edit ~/src/casl-ansible/inventory/sample.aws.example.com.d/inventory/group_vars/OSEv3.yml for your AWS specific configuration. See comments in the file for more detailed information on how to fill these in.
1. Run the end-to-end provisioning playbook via our AWS installer container image. ** COMING SOON **
```
docker run -u `id -u` \
      -v $HOME/.ssh/id_rsa:/opt/app-root/src/.ssh/id_rsa:Z \
      -v $HOME/src/:/tmp/src:Z \
      -e INVENTORY_DIR=/tmp/src/casl-ansible/inventory/sample.aws.example.com.d/inventory \
      -e PLAYBOOK_FILE=/tmp/src/casl-ansible/playbooks/openshift/end-to-end.yml \
      -e OPTS="-e aws_key_name=my-key-name" -t \
      redhatcop/installer-aws
```

## License
[ASL 2.0](LICENSE)
