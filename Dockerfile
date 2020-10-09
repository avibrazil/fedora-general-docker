FROM fedora
MAINTAINER Avi Alkalay <avi at unix.sh>

ARG USERNAME=aviram

COPY ssh_host* /etc/ssh/
COPY authorized_keys /home/$USERNAME/.ssh/

# Install required Python stack and libs
RUN dnf -y update; \
	dnf -y install openssh-server passwd shadow-utils tmux; \
	dnf -y install procps-ng net-tools dos2unix file; \
	dnf clean all; \
	mkdir -p /var/run/sshd; \
	chown root.ssh_keys /etc/ssh/ssh_host*; \
	chmod a-x,go-wx,o-r /etc/ssh/ssh_host*; \
	chown root.root /etc/ssh/ssh_host*pub; \
	chmod go+r /etc/ssh/ssh_host*pub; \
	useradd $USERNAME; \
	chown -R $USERNAME. /home/$USERNAME; \
	chown -R $USERNAME. /home/$USERNAME/.ssh; \
	chmod -R go-rwx /home/$USERNAME/.ssh;
	
VOLUME /home/$USERNAME/host
	
EXPOSE 22

# CMD ["/usr/sbin/sshd", "-D"]
ENTRYPOINT ["/usr/sbin/sshd", "-D"]
