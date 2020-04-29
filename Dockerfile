FROM ubi:8

RUN yum -y install httpd php && yum clean all 

RUN sed -i 's/Listen 80/Listen 8080/' /etc/httpd/conf/httpd.conf

WORKDIR /var/www/html
COPY index.php script.sh ./

RUN find -L /run/httpd /etc/httpd /var/www/html -exec chown -R 1001:0 {} \; -exec chmod -R g+rwX {} \;

EXPOSE 8080
USER 1001
CMD ["httpd", "-DFOREGROUND"]
