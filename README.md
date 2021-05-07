# bind9 container

This is a very simple bind9 container based on Debian.

It was created primarily to use alongside the
[samba container](https://github.com/opensourcery-uk/container-samba) in the
Kubernetes manifests that make up the
[samba-ad-dc](https://github.com/opensourcery-uk/kubernetes-samba-ad-dc)
repository.

It could easily be used for other purposes.

It makes no assumptions about your setup. There are no defaults beyond that
provided by the packages. You will likely have to configure everything
yourself.

## entrypoint.d

/entrypoint.d is provided in the container in which you can put custom shell
scripts to help setup the container. This is simple in a Kubernetes environment
via ConfigMaps for example.

Scripts in /entrypoint.d must have names ending in '.sh'.

Scripts should be executable by the user that the process in the container
runs as (root by default).

Scripts are run in asciibetical order (or whatever the modern equivalent of
that is with modern filesystems and charactersets).

## usage

A built container is available as: docker.io/opensourcery/bind9
