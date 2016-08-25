FROM ubuntu:latest
RUN apt-get update \
	&& apt-get install -y php7.0 php7.0-dev libevent-dev libssl-dev git pkg-config
RUN yes '' | pecl install event eio
RUN echo "extension=event.so" >> /etc/php/7.0/cli/conf.d/event.ini \
	&& echo "extension=eio.so" >> /etc/php/7.0/cli/conf.d/eio.ini 
RUN git clone https://github.com/kakserpom/phpdaemon.git /usr/share/phpdaemon
COPY phpd.conf /etc/phpd/phpd.conf
COPY Sample.php /phpd/Sample.php