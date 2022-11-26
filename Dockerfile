FROM debian:latest

CMD ["bash"]
RUN apt-get update && apt-get install -y iputils-ping htop vim ca-certificates default-mysql-client wget curl telnet mtr git xz-utils screen
COPY scripts /opt/scripts
COPY .keymaster /opt
#RUN cd /opt/scripts/ && ./build.sh
#RUN screen -dm /bin/bash -c ' cd /opt/fivem/essenciais/ && ./run.sh +exec server.cfg'
