FROM centos:latest
MAINTAINER Parthasarathi

# Install Apache HTTP server, zip, and unzip
RUN yum install -y httpd \
    zip \
    unzip

# Add and unzip the web template
ADD https://www.free-css.com/assets/files/free-css-templates/download/page265/shine.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip shine.zip && \
    cp -rvf shine/* . && \
    rm -rf shine shine.zip

# Start Apache in the foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

# Expose the necessary ports
EXPOSE 80 














# FROM  centos:latest
# MAINTAINER Parthasarathi
# RUN yum install -y httpd \
#  zip\
#  unzip
#  ADD https://www.free-css.com/assets/files/free-css-templates/download/page265/shine.zip /var/www/html/
#  WORKDIR /var/www/html/
#  RUN unzip shine.zip
#  RUN cp -rvf shine/* .
#  RUN rm -rf shine shine.zip
#  CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
#  EXPOSE 80 22 11


#  sshagent(['ansible_demo']) 
#                 {
#                     sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.1.50'
#                     sh 'scp /var/lib/jenkins/workspace/pipelin-demo/* ubuntu@172.31.1.50:/home/ubuntu'
#                 }