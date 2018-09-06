aws ecr get-login --no-include-email

docker login -u AWS -p *************

docker build . -t letsencrypt

docker tag letsencrypt:latest xxxxxxxxxxxx.dkr.ecr.ap-southeast-2.amazonaws.com/letsencrypt:latest

docker push letsencrypt:latest xxxxxxxxxxxx.dkr.ecr.ap-southeast-2.amazonaws.com/letsencrypt:latest
