Production support team of xFusionCorp Industries is working on developing some bash scripts to automate different day to day tasks. One of them is to create a bash script for taking websites backup. They have a static website running on App Server 1 in Stratos Datacenter. They need to create a bash script named official_backup.sh which should accomplish below given tasks. (Also remember to place the script under /scripts directory on App Server 1)

a. Create a zip archive named xfusioncorp_official.zip of /var/www/html/official directory.

b. Save the archive in /backup/ on App Server 1. This is a temporary storage as backups from this location will be clean on weekly basis so we also need to save this backup archive on Nautilus Backup Server.

c. Copy the created archive to Nautilus Backup Server server in /backup/ location.

d. Please make sure script won't ask for password while coping the archive file also respective server user (for example tony in case of App Server 1) must be able to run it.