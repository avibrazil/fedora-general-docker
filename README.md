# General purpose Docker image to login via SSH

Edit the `Dockerfile`, add you own list of Fedora packages, edit the user name,
substitute the `authorized_keys` file content with your own public SSH keys and rebuild like this:

```shell
docker build --rm --build-arg USERNAME=myname -t myname/general-fedora .
```

Then run it like this:
```shell
docker run -d -p 2222:22 -v /home/in/host:/home/myname/host myname/general-fedora service nginx start
```

Enjoy