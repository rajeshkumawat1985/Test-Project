# Use CentOS as the base image
FROM centos:latest
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
# Install Apache (httpd)
RUN yum install httpd zip wget unzip -y
#Download the Free Styl Templete
RUN wget -O /var/www/html/brighton.zip https://www.free-css.com/assets/files/free-css-templates/download/page290/brighton.zip
#Unzip the zip file
WORKDIR /var/www/html
RUN unzip brighton.zip
#Copy zip to into html
RUN cp -rf brighton-html/* .&&\
    rm -rf brighton-html
#Export the port 80
EXPOSE 8091
CMD ["/usr/sbin/httpd", "D", "FOREGROUND"]
