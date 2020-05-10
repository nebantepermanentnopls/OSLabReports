FROM debian

COPY debian.list /etc/apt/sources.list.d/

RUN 	apt-get update && \
	apt-get -y upgrade && \
	apt-get -y install nginx && \
	apt-get clean && \
	rm -rf /var/www/* && \
	mkdir -p var/www/nebante.com/img
	
COPY index.html /var/www/nebante.com
COPY img.jpg /var/www/nebante.com/img

RUN	chmod -R 754 var/www/nebante.com && \
	useradd Alexey && \
	groupadd Chistyakov && \
	usermod -aG Chistyakov Alexey && \
	chown -R Alexey:Chistyakov var/www/nebante.com && \
	sed -i 's/\/var\/www\/html/\/var\/www\/nebante.com/g' /etc/nginx/sites-enabled/default && \
	sed -i 's/user www-data/user Alexey/g' /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]
