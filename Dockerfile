FROM ubuntu
MAINTAINER Łukasz Gryglicki<lukaszgryglicki@o2.pl>
WORKDIR /stackalytics
ADD . /stackalytics
RUN apt-get update
# Install all requirements
RUN apt-get install -y `cat apt-requirements.txt`
RUN sudo pip install -r requirements.txt
RUN sudo python setup.py install
# Add facade user and add him to sudoers to allow `sudo` usage
RUN useradd -p stackalytics stackalytics
RUN echo 'stackalytics:stackalytics' | chpasswd
RUN adduser stackalytics sudo
# Set root password
RUN echo 'root:root' | chpasswd
EXPOSE 80
EXPOSE 22
# Default server command
CMD /stackalytics/server.sh
