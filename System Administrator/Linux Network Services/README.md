####  Linux Network Services 

Our monitoring tool has reported an issue in Stratos Datacenter where one of our app server has some issue as its Apache service is not reachable on port 8089 (which is our Apache port). Either service it self is down or some firewall or something is causing the issues.

Try to test yourself using tools like telnet and netstat etc and fix the issue once identified. Also make sure Apache is reachable from jump host without compromising any security settings.