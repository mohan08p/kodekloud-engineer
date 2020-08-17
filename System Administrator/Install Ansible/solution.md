#### Install Ansible

1. On jump host install python, devel and pip resepctively as below,

```
sudo yum install python-pip python-devel python
```

2. Upgrade the pip using --upgrade flag,

```
sudo pip install pip --upgrade
```

3. Now, install ansible specific version using pip package manager,

```
sudo pip install ansible==2.6.10
```

4. Finally verify that respective version of pip installation.

```
thor@jump_host /$ ansible --version
/usr/lib64/python2.7/site-packages/cryptography/__init__.py:39: CryptographyDeprecationWarning: Python 2 is no longer supported by the Pythoncore team. Support for it is now deprecated in cryptography, and will be removed in a future release.
  CryptographyDeprecationWarning,
ansible 2.6.10
  config file = None
  configured module search path = [u'/home/thor/.ansible/plugins/modules', u'/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python2.7/site-packages/ansible
  executable location = /usr/bin/ansible
  python version = 2.7.5 (default, Apr  2 2020, 13:16:51) [GCC 4.8.5 20150623 (Red Hat 4.8.5-39)]
```
Thank you.
