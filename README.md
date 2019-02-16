# Docker-Ubuntu-Unity-Ansible-GNS3

Dockfile for Ubuntu with Unity desktop environment providing Ansible and associated tools. 

This **Image/Dockerfile** aims to create a container for **Ubuntu 16.04** with **Unity Desktop** which allow user to use Devops tools (Ansible-paramiko-netmiko-napalm-Atom) with this container.

## How to use?

You can build this **Dockerfile** yourself:

```
sudo docker build -t "stherien/gns3-net-automation" .
```

Or, just pull my **image**:

```
sudo docker pull stherien/gns3-net-automation
```

The default usage of this image is:

```
Start Gns3 and create a Docker image using stherien/gns3-net-automation.
Then drag the newly created image on Gns3 desktop app to start pulling image from DockerHub.
```


![alt text](https://github.com/stherien/Docker-Ubuntu-Unity-Ansible-GNS3/raw/master/gns3-docker.png "Docker image installation")



Edit gns3-net-automation configuration and adjust the default parameters of this image:

```
1 - Set Console type to vnc
2 - Adjust screen size
3 - Set Environment variable as follows: PASSWORD=ubuntu
```


![alt text](https://github.com/stherien/Docker-Ubuntu-Unity-Ansible-GNS3/raw/master/gns3-config.png "Initial configuration")



Once you connect to the console, you can see this screen:


![alt text](https://github.com/stherien/Docker-Ubuntu-Unity-Ansible-GNS3/raw/master/gns3-audg.png "gns3-net-automation")



## Arguments

This image contains one input argument:

Password

   You can set your own ubuntu user password as you like:

   The ubuntu user **password** will be taken from the PASSWORD environment variable.



## root user

This image will run as root except for Firefox which will run as ubuntu user.



## Screen size

The default setting of screen size will be as per defined Gns3 Docker parameter.

You can change screen size in Gns3 Docker image configuration panel.



## Issues

Everything run as root except for Firefox. This is less than a concer for now since it's running under a Gns3 comntrolled environment.
