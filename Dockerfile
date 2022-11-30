FROM debian:latest

CMD ["bash"]
RUN apt-get update && apt-get install -y iputils-ping htop vim ca-certificates default-mysql-client wget curl telnet mtr git xz-utils screen unzip
COPY scripts /opt/scripts
COPY .keymaster /opt
