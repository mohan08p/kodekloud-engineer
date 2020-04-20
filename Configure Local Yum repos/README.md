####  Configure Local Yum repos 

Nautilus production support team and security team had a meeting last month in which they decided to use local yum repositories for maintaing packages needed for their servers. For now they have decided to configure a local yum repo on Nautilus Backup Server. This is one of the pending item from last month so please configure a local yum repository on Nautilus Backup Server as per details given below.

a. We have some packages already present at location /packages/downloaded_rpms/ on Nautilus Backup Server.

b. Create a yum repo named localyum and make sure to set Repository ID to localyum. Configure it to use packages location /packages/downloaded_rpms/.

c. Install package wget from this newly created repo.