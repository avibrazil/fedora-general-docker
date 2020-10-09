# General purpose Docker image (based on Fedora) to login via SSH

Edit the `Dockerfile`, add you own list of Fedora packages, edit the user name,
substitute the `authorized_keys` file content with your own public SSH keys and rebuild like this:

```shell
docker build --rm --build-arg USERNAME=myname -t myname/fedora-general .
```

Then run it like this:
```shell
docker run -d -p 2222:22 -v /home/in/host:/home/myname/host myname/fedora-general
```

Then connect on port 2222 of host machine with your SSH client.
No password is needed to login into container thanks to your public key included in `authorized_keys` and implanted into the image's user home at image build time.

Enjoy