# Ug: Minimalist git system

Ug is a minimalist git system with client and server components.
The **server** is a container running SSH with a designated directory for storing the repositories.
The **client** is a shell script that uses SSH to manage those repositories.

### Build

- Open ug.sh.
- Change the `UGSSH` variable.
- Execute `$ make`.
- Copy the file to a directory in your `PATH`.

### Install

- Log into your container host.
- Copy the compose.yaml file.
- Spin the compose file up.
- Execute `$ podman exec -it NAME_OF_CONTAINER /bin/ash -i`.
- When in the container, execute: `$ echo 'PUBLIC_SSH_KEY' >> /root/.ssh/authorized_keys`.
