To access the Kubernetes API [from a Pod](https://kubernetes.io/docs/concepts/cluster-administration/proxies/) one of the solution is to run `kubectl proxy` in a so-called sidecar container within the Pod. To do this, you need to package `kubectl` in a container. It is useful when service accounts are being used for accessing the API and the old no-auth KUBERNETES_RO service is not available. Since all containers in a Pod share the same network namespace, containers will be able to reach the API on localhost.

This example contains a [Dockerfile](Dockerfile) and [Makefile](Makefile) for packaging up `kubectl` into a container and pushing the resulting container image on the Docker Hub Registry. You can modify the Makefile to push to a different registry if needed.

Assuming that you have checked out the Kubernetes source code and setup your environment to be able to build it. The typical build step of this kubectl container will be:

```console
$ make kubectl
$ make tag
$ make container
$ make push
```

Usage:

```console
$ `make kubectl` will build kubectl.
$ `make tag` will suggest a tag.
$ `make container` will build a container-- you must supply a tag.
$ `make push` will push the container-- you must supply a tag.
```

It is not currently automated as part of a release process, so for the moment this is an example of what to do if you want to package `kubectl` into a container and use it within a pod.

[```pod.yaml``](pod.yaml) is provided as an example of running `kubectl` as a sidecar
container in a Pod, and to help you verify that `kubectl` works correctly in
this configuration. To launch this Pod, you will need a configured Kubernetes endpoint and `kubectl` installed locally, then simply create the Pod:

```
$ kubectl create -f pod.json
```
