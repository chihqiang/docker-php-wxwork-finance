ARG IMAGE_TAG="7.4-fpm"

FROM zhiqiangwang/php:${IMAGE_TAG}

ADD ./wxwork_finance_sdk /usr/local/lib/php/wxwork_finance_sdk

ADD ./sdk /usr/local/lib/php/wxwork_finance_sdk/sdk

RUN cd /usr/local/lib/php/wxwork_finance_sdk \
    && phpize  \
    && ./configure --with-php-config=/usr/local/bin/php-config --with-wxwork-finance-sdk=./sdk  \
    && make && make install 

RUN rm -rf /usr/local/etc/php/conf.d/docker-php-ext-swoole.ini \
    && echo "extension=wxwork_finance_sdk" > /usr/local/etc/php/conf.d/swoole-with-wx.ini \
    && echo "extension=swoole" >> /usr/local/etc/php/conf.d/swoole-with-wx.ini