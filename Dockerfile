# Use CentOS as the base image
FROM centos:latest

# Install Apache (httpd)
RUN yum install httpd zip wget unzip -y
#Download the Free Styl Templete
RUN wget -o /var/www/html/brighton.zip https://www.free-css.com/assets/files/free-css-templates/download/page290/brighton.zip
#Unzip the zip file
WORKDIR /var/www/html
RUN unzip brighton.zip
#Copy zip to into html
RUN cp -rvf brighton-html/* .&&\
    rm -rf brighton-html
#Export the port 80
EXPOSE 80
CMD ["/usr/sbin/httpd", "D", "FOREGROUND"]
