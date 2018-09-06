FROM python:latest

RUN pip install certbot certbot-dns-route53 awscli

COPY execute.sh /bin/

ENTRYPOINT /bin/execute.sh
