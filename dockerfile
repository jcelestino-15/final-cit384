
FROM ubuntu:latest
ENV DEBIAN_FRONTEND=nonintercative

#update and install packages
RUN apt update
RUN apt install -y vim
RUN apt install -y apache2
RUN apt install -y sudo 
RUN apt install -y apache2-utils

#enable the UserDir module
RUN a2enmod userdir
#enable DirectoryIndex module
RUN a2enmod autoindex

#enabling other Apache modules
RUN a2enmod rewrite
RUN a2enmod alias
RUN a2enmod auth_basic
RUN a2enmod ssl
RUN a2enmod headers
RUN a2enmod cgi
RUN a2enmod cgid

COPY apache2.conf /etc/apache2/apache2.conf

#creating self signed certificates and placing in appropriate location
RUN sudo mkdir -p /etc/apache2/ssl/
RUN openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=US/ST=CA/L=Los Angeles/O=CSUN/OU=CIT/CN=server_IP_address" -keyout /etc/apache2/ssl/ssl.key -out /etc/apache2/ssl/ssl.crt 

# adding group
RUN sudo groupadd cit384

#user1
RUN adduser tobi
RUN passwd -d tobi
RUN sudo usermod -aG cit384 tobi

#user2
RUN adduser yogi
RUN passwd -d yogi
RUN sudo usermod -aG cit384 yogi

WORKDIR /etc/apache2/conf-available/
COPY serve-cgi-bin.conf .

WORKDIR /home/tobi/public_html
COPY tobiindex.html .
ADD tobi.jpg .

WORKDIR /home/yogi/public_html
ADD yogi.jpg .
COPY yogiindex.html .

WORKDIR /home/yogi/public_html/cgi-bin
COPY user.cgi .
RUN sudo chmod +x /home/yogi/public_html/cgi-bin/user.cgi


WORKDIR /var/www/html
RUN sudo mkdir -p /mywebsite.cit384/public_html
RUN sudo mkdir -p /special.cit384/public_html
RUN sudo mkdir -p /final.cit384/public_html

#modifying permission to web dir
RUN sudo chmod -R 775 /var/www/html

WORKDIR /var/www/html/mywebsite.cit384/public_html
COPY mywebsiteindex.html .
RUN mv mywebsiteindex.html index.html

WORKDIR /var/www/html/special.cit384/public_html
COPY specialindex.html .
RUN mv specialindex.html index.html


# creating password protected directory 
RUN sudo mkdir -p /var/www/html/final.cit384/public_html/submission
WORKDIR /var/www/html/final.cit384/public_html/submission
COPY submission.md .
RUN sudo htpasswd -c /home/submission.txt tobi
COPY .htaccess .


COPY mywebsite.cit384.conf  /etc/apache2/sites-available
COPY special.cit384.conf /etc/apache2/sites-available
COPY final.cit384.conf /etc/apache2/sites-available

#enable the 3 websites
RUN sudo a2ensite mywebsite.cit384.conf
RUN sudo a2ensite special.cit384.conf
RUN sudo a2ensite final.cit384.conf

#disabling defeault site
RUN sudo a2dissite 000-default.conf

# Add in other directives as needed
LABEL Maintainer: "jazmin.celestino.694@my.csun.edu"

EXPOSE 80
CMD ["/usr/sbin/apache2ctl", "-D","FOREGROUND"]
