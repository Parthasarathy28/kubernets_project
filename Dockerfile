FROM  centos:latest
MAINTAINER Parthasarathi
RUN yum install -y httpd \
 zip\
 unzip
 ADD https://www.free-css.com/assets/files/free-css-templates/download/page265/shine.zip /var/www/html/
 WORKDIR /var/www/html/
 RUN unzip shine.zip
 RUN cp -rvf shine/* .
 RUN rm -rf shine shine.zip
 CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
 EXPOSE 80 22 11


#  sshagent(['ansible_demo']) 
#                 {
#                     sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.1.50'
#                     sh 'scp /var/lib/jenkins/workspace/pipelin-demo/* ubuntu@172.31.1.50:/home/ubuntu'
#                 }