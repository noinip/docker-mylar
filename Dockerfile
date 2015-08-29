FROM phusion/baseimage:0.9.16
MAINTAINER pinion <pinion@gmail.com>
ENV DEBIAN_FRONTEND noninteractive

# Set correct environment variables
ENV HOME /root

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

# Fix a Debianism of the nobody's uid being 65534
RUN usermod -u 99 nobody
RUN usermod -g 100 nobody

RUN apt-get update -qq

# install dependencies for building mylar
RUN apt-get install python git-core python-openssl wget -qq
RUN apt-get clean

# download and install mylar
RUN git clone https://github.com/evilhero/mylar.git -b development /opt/mylar
RUN git clone https://github.com/davide-romanini/comictagger.git /opt/comictagger
RUN cp -R /opt/comictagger /opt/mylar
RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py
RUN pip install configparser
RUN pip install beautifulsoup4
RUN pip install unrar
RUN pip install natsort
RUN pip install PyPDF2
RUN chown nobody:users /opt/mylar


EXPOSE 8090


# mylar Configuration
VOLUME /config

# Downloads directory
VOLUME /downloads

# comics directory
VOLUME /comics

# Copy out the auto processing scripts to the config directory
RUN cp -R /opt/mylar/post-processing/ /config/

# Add mylar to runit
RUN mkdir /etc/service/mylar
ADD mylar.sh /etc/service/mylar/run
RUN chmod +x /etc/service/mylar/run
