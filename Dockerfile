FROM ubuntu:trusty

MAINTAINER Pierre Breitschmitt <pierre@loobaz.com>

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -yq upgrade && \
    DEBIAN_FRONTEND=noninteractive apt-get -yq install \
        curl \
        apache2 \
        libapache2-mod-php5 \
        php5-mysql \
        php5-gd \
        php5-curl \
        php-pear \
        php-apc && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf && \
    sed -i "s/variables_order.*/variables_order = \"EGPCS\"/g" /etc/php5/apache2/php.ini

ENV ALLOW_OVERRIDE **False**

ADD start.sh /start.sh
RUN chmod 755 /*.sh
RUN mkdir -p /app && rm -fr /var/www/html && ln -s /app /var/www/html
ADD app/ /app

EXPOSE 80

WORKDIR /app

CMD ["/start.sh"]