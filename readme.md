# IMAGE DOCKER NGINX + SSH + ZSH + OH-MY-ZSH

Esta imagen de docker contiene un servidor nginx con ssh y zsh instalado.

### Caracteristicas

- Esta imagen expone el puerto 80 y 22 (nginx y ssh respectivamente)
- El usuario por defecto es `root` y la contraseña `root`
- SSH host check está desactivado

### Uso

Crear el contenedor con el siguiente comando:

```bash
docker run --hostname {hostname} -p 80:80 -p 22:22 -d --name {nombre_contenedor} jssdocente/nginx-ssh-zsh:{tag}
```

Y para acceder al contenedor por ssh:

```bash
ssh root@localhost
```

Si se desea utilizar otro puerto para SSH, al crear el contenedor se debe mapear el puerto 22 del contenedor a otro puerto del host, en el ejemplo se ha utilizado el puerto 2222:

```bash
docker run --hostname {hostname} -p 80:80 -p 2222:22 -d --name {nombre_contenedor} jssdocente/nginx-ssh-zsh:{tag}
```

Y para acceder al contenedor por ssh:

```bash
ssh root@localhost -p 2222
```
  

### Recursos utilizados

- [Oh-my-zsh para Docker](https://github.com/deluan/zsh-in-docker)
- [SSH en Docker](https://github.com/rastasheep/ubuntu-sshd)
- [Docker-nginx-ssh (ejemplo)](https://github.com/teran/docker-nginx-ssh/tree/master)
  


