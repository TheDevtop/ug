# Ug: Minimalist git system

Ug is a minimalist git system with client and server components.
The **server** is a container running SSH with a designated directory for storing the repositories.
The **client** is a shell script that uses SSH to manage those repositories.

### Install

- Open ug.sh.
- Change the `UGSSH` variable.
- Execute `$ make`.
- Copy the file to a directory in your `PATH`.
- Log into your container host.
- Copy the compose.yaml file.
- Create a file called "keys".
- Spin the compose file up.
