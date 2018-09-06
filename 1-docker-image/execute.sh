#!/bin/bash

#multiple domains are separated by commas. split a long string to domains
DOMAIN=${DOMAIN/,/ -d };

aws s3 sync s3://${S3_BUCKET}/${S3_PREFIX} /etc/letsencrypt;

certbot certonly -n --agree-tos --email ${EMAIL} --dns-route53 -d ${DOMAIN} ${DRY_RUN};

aws s3 sync /etc/letsencrypt s3://${S3_BUCKET}/${S3_PREFIX};
