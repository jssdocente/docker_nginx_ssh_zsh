FROM nginx:1.25
MAINTAINER jssdocente

RUN apt update && \
    apt install -y  -y --no-install-suggests --no-install-recommends \
    nano git openssh-server \
    supervisor

# Configuracion de ssh
RUN mkdir /var/run/sshd
RUN echo 'root:root' | chpasswd
# Permitir root login en la configuracion de ssh
RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
RUN mkdir -p /root/.ssh

# Configuración ZSH
# >> Default powerline10k theme, no plugins installed    
RUN sh -c "$(curl -L https://github.com/deluan/zsh-in-docker/releases/download/v1.1.5/zsh-in-docker.sh)"
RUN chsh -s /bin/zsh root 

# limpieza de cache
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


# Configuracion de supervisor
COPY src/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY src/entrypoint.sh /entrypoint.sh
COPY src/ssh/config /root/.ssh/config

EXPOSE 80
EXPOSE 22

ENTRYPOINT ["/entrypoint.sh"]