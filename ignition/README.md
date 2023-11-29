Fedora CoreOS
=============

You can either try embedding an ignition configuration within a FCOS ISO image, using a Butane config, and the provided `create-iso.sh` script (requires `butane` and `coreos-installer` available on your `$PATH`), or, you can generate the ignition file, host that on a web server (preferably TLS'd, as this lowers the amount of typing required) and then boot a "vanilla" FCOS ISO image, then use the `coreos-installer` command on that system to install FCOS using the Ignition config hosted elsewhere.

To install a multi-controlplane k3s cluster with `etcd` you need to use a "Bootstrap" ignition for the first control-plane, and then a "normal" ignition for the other two control-plane nodes there-after.
