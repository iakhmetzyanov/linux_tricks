This config goes to /etc/nginx/conf.d and it covers load balancing of an old-fasion java backend app in several instances running by Apache Tomcats. This config soleves tests server problem when the app runs on custom port and with ancient "/fx" endinx but you are really want it to go through SSL by force redirecting from 8080 to 8443. 
So for example if you are typing myserver.org:8080 or myserver.org:8443 at the address bar the Nginx will redirect you to https://myserver.org:8443/fx

