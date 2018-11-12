[root@lightsail ~]# cd /etc/letsencrypt 
[root@lightsail letsencrypt]# find . -mtime -1
./archive/funnyto.be-0001/cert1.pem 
./archive/funnyto.be-0001/chain1.pem
./archive/funnyto.be-0001/fullchain1.pem
./archive/funnyto.be-0001/privkey1.pem
./csr/0007_csr-certbot.pem
./keys/0007_key-certbot.pem 
./live/funnyto.be/README
./live/funnyto.be/cert.pem
./live/funnyto.be/chain.pem 
./live/funnyto.be/fullchain.pem 
./live/funnyto.be/privkey.pem 
./renewal/funnyto.be-0001.conf

[root@lightsail ~]# cd /etc/letsencrypt/live/
[root@lightsail live]# mv funnyto.be-0001/* funnyto.be/

[root@lightsail live]# /etc/init.d/nginx configtest 
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful
[root@lightsail live]# /etc/init.d/nginx reload 
Reloading nginx: [OK]
