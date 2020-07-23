#### Ansible Create Users and Groups

Several new developers and DevOps engineers just joined xFusionCorp industries. They have been assigned the Nautilus project, and as per the usual initial process we need to create user accounts for new joinees on at least one app server in Stratos DC. We also need to create groups and make new users members of those groups. We need to accomplish this task using Ansible. Below is more information about the task.


There is already an inventory file ~/playbooks/inventory on jump host.

On jump host itself there is a list of users in ~/playbooks/data/users.yml file and there are two groups — admins and developers —that have list of different users. Create a playbook ~/playbooks/add_users.yml on jump host to perform the following tasks on app server 3 in Stratos DC.

a. Add all users given in users.yml file on app server 3.

b. Also add groups developers and admins on same server.

c. As per the list given in users.yml file, make each user member of the respective group they are listed under.

d. Make sure home directory for all users under developers group is /var/www. For admins make sure it is default.

e. Set password LQfKeWWxWD for all users under developers group and GyQkFRVNr3 for users under admins group. Make sure to use the password given in ~/playbooks/secrets/vault.txt file as Ansible vault password to encrypt the original password strings. You can use ~/playbooks/secrets/vault.txt file as vault secret file while running the playbook (make necessary changes in ~/playbooks/ansible.cfg file).

f. All users under admins group must be added as sudo users. To do so, simply make them member of wheel group as well.

Note: Validation will try to run playbook using command ansible-playbook -i inventory add_users.yml so please make sure playbook works this way, without passing any extra arguments.
