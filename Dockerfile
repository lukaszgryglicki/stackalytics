FROM ubuntu
MAINTAINER Łukasz Gryglicki<lukaszgryglicki@o2.pl>
WORKDIR /stackalytics
ADD . /stackalytics
RUN apt-get update
# Install all requirements
RUN apt-get install -y `cat apt-requirements.txt`
RUN sed -i 's/-m 64/-m 1024/' /etc/memcached.conf
RUN sed -i 's/# -M/-M/' /etc/memcached.conf
RUN pip install --upgrade pip
RUN sudo pip install -r requirements.txt
RUN sudo python setup.py install
RUN memcached -u memcache -d
# Add facade user and add him to sudoers to allow `sudo` usage
RUN useradd -p stackalytics stackalytics
RUN echo 'stackalytics:stackalytics' | chpasswd
RUN adduser stackalytics sudo
# Set root password
RUN echo 'root:root' | chpasswd
RUN mkdir /opt/stack/
RUN chown stackalytics.stackalytics /opt/stack
RUN mkdir /var/local/stackalytics
RUN chown stackalytics.stackalytics /var/local/stackalytics
EXPOSE 8080
EXPOSE 22
# Default server command
CMD /stackalytics/server.sh
