#Select image for container, update image, & install nginx
FROM ubuntu
RUN apt-get update
RUN apt-get install -y nginx
#Remove nginx default file & copy 3 new files to proper directories
RUN rm -f /etc/nginx/sites-enabled/default
COPY default /etc/nginx/sites-enabled/default
COPY 22.txt /var/www/html/22.txt
COPY 33.txt /var/www/html/33.txt
#Since container needs at least 1 running process,
#this command executes nginx in the foreground (-g)
#w/ the background daemon off. So, once we start
#this container, it will continue to run once
#we exit it.
#4 Different Syntax Options:
#Those in brackets closely mirror JSON format.
#If we choose CMD, then we have to explicitly
#name the entire command that follows.
CMD ["/usr/sbin/nginx", "-g", "daemon off;"] 
#or
#ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]
#or
#CMD /usr/sbin/nginx -g daemon off
#or
#ENTRYPOINT /usr/sbin/nginx -g daemon off
