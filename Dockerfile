FROM centos:7
RUN yum -y install httpd && yum clean all 
RUN sed -i 's/Listen 80/Listen 8080/' /etc/httpd/conf/httpd.conf
CMD ["httpd", "-DFOREGROUND"]
EXPOSE 8080
WORKDIR /var/www/html
ADD index.html .
