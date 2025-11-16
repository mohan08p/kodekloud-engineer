#### Firewall Configuration

The Nautilus system admins team has rolled out a web UI application for their backup utility on the Nautilus backup server within the Stratos Datacenter. This application operates on port 8085, and firewalld is active on the server. To meet operational needs, the following requirements have been identified:

Allow all incoming connections on port 8085/tcp. Ensure the zone is set to public.