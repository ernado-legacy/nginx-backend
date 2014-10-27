FROM cydev/nginx-balancer

MAINTAINER Alexandr Razumov ernado@ya.ru

# copying config files and templates
RUN rm /etc/confd/conf.d/* /etc/confd/templates/*
ADD config.toml /etc/confd/conf.d/
ADD config.tmpl /etc/confd/templates/
ADD nginx.tmpl  /etc/confd/templates/
ADD run.sh      /usr/bin/run.sh

ENTRYPOINT ["run.sh"]