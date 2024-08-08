FROM ubuntu:latest
MAINTAINER parthasarathi.parandhaman@gmail.com

# Update package list and install apache2, zip, and unzip
RUN apt-get update && apt-get install -y apt-utils && apt-get install -y curl
RUN apt-get update && \
    apt-get install -y apache2 zip unzip && \
    apt-get clean

# Add the zip file from the web and store it in /var/www/html
ADD https://github.com/adrianhajdin/project_syncfusion_dashboard.git  /var/www/html/

# Set the working directory
WORKDIR /var/www/html/

# Unzip the file, copy the contents, and remove the zip file and the directory created from unzipping
#RUN unzip carvilla.zip && \
 #   cp -rvf carvilla /* . && \
#    rm -rf carvilla  carvilla.zip

# Start apache2 in the foreground
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

# Expose port 80
EXPOSE 70


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