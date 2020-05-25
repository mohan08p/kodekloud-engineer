####  Ansible Ping Module Usage

First, create an ssh public-private key on ansible server(jump_host)

    ssh-keygen

Then, copy ssh pulic key you created in the above step to the reomte host i.e. app server two,

    ssh-copy-id -i ~/.ssh/id_rsa.pub steve@172.16.238.11

Check the inventory file and group namep[strapp] for the hosts mentioned in there,

    vi /home/thor/ansible/inventory
    ...
    [strapp]
    stapp01 ansible_host=172.16.238.10 ansible_ssh_pass=Ir0nM@n ansible_user=tony
    stapp02 ansible_host=172.16.238.11 ansible_ssh_pass=Am3ric@ ansible_user=steve
    stapp03 ansible_host=172.16.238.12 ansible_ssh_pass=BigGr33n ansible_user=banner

save and close the file.

Finally, you can run a ping module to check the connectivity from ansible control node to app server 2 using below command,

    ansible -i /home/thor/ansible/inventory -m ping strapp
    tapp02 | SUCCESS => {    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": false,
    "ping": "pong"
    }stapp01 | SUCCESS => {
    "ansible_facts": {        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": false,
    "ping": "pong"
    }
    stapp03 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": false,
    "ping": "pong"
    }

**NOTE: I am getting success for all 3 server as I copied ssh public key to all 3 app servers**

Hope it helps. Thanks.
