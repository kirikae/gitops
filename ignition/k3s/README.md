This directory contains my effort to get `k3s`, using CRI-O container-runtime, running on top of Universal Blue's `ucore` in a fully HA mode (i.e. 3 `servers` with embedded `etcd`).
Additional `agents` can be added as required.

`ucore` is a variant of Fedora CoreOS that can easily contain the requisite "stuff" to support usage of ZFS, and Nvidia graphics cards.
Additionally, it has full SecureBoot support maintained as part of the project.

Further, as I have OPNsense / pfSense, I wish to utilise BGP for my routing in addition to having dual-stack IPv4+IPv6

Based on work posted here:

* https://devopstales.github.io/kubernetes/k3s-crio/
* https://wiki.larsl.net/kubernetes/k3s-setup/
* https://thelinuxnotes.com/index.php/deploying-a-kubernetes-cluster-on-fedora-coreos-with-cri-o/
* https://devnonsense.com/posts/k3s-on-fedora-coreos-bare-metal/
* https://github.com/cri-o/packaging/blob/main/README.md#stable-versions
* https://docs.k3s.io/cli/server#k3s-server-cli-help
