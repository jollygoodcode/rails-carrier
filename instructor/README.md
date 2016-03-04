# Note for Instructor

## Build a _Linux_ (Vagrant) Box from Scratch

> _This should take about an hour or less._

First, you'll need to _install_ Linux on your machine using VirtualBox and Vagrant.

Once we have _Linux_ setup on your machine, we will then proceed to set up a Virtual Machine for Rails development.

### Setup a Virtual Machine for Ubuntu 14.04

Open up your Terminal.

For Mac/Linux users, find the Terminal app.

For Windows users, click on Windows Start and type "cmd" in the "Search programs and files" search field.
Open `cmd.exe`. That's the Terminal equivalent in Windows.

Create and change into into a directory which you'll be using for all of your coding needs, e.g. `~/workshop/` or `C:\workshop`

```
$> mkdir workshop
$> cd workshop
```

Clone this repository.

```
$> git clone https://github.com/jollygoodcode/rails-carrier.git
```

Copy the following files to the `workshop` directory:

```
$> cp rails-carrier/Vagrantfile .
$> cp rails-carrier/sail.sh .
```

In the directory, verify `Vagrantfile` exists.

The `Vagrantfile` should have the following important information:

```
config.vm.box = "ubuntu/trusty32"
```

This is to install a Ubuntu Trusty 32-bit build. Change this accordingly.

```
config.vm.network :forwarded_port, guest: 3000, host: 3000
```

This is to allow network access in your Vagrant box.

```
config.vm.provision :shell, path: "sail.sh", keep_color: true
```

This instructs Vagrant to use `sail.sh` for provisioning the Linux box.

Take a look at [`sail.sh`](https://github.com/jollygoodcode/rails-carrier/blob/master/sail.sh) to see what we have included in the VM.

**[Troubleshooting] Are you sitting behind a proxy server? [Behind a Proxy Server](#behind-a-proxy-server).**

Type the following to bring up the Virtual Machine for Ubuntu 14.04.

```
$> vagrant up
```

Wait for `vagrant up` to be completed (~ 10 mins), then SSH into the VM:

```
$> vagrant ssh
```


## Extra: Package a Box (For Coaches Only)

After you have built a VM from scratch in [2. Build a _Linux_ (Vagrant) Box from Scratch](#2-build-a-linux-vagrant-box-from-scratch),
you can package the VM for sharing. [Read](https://docs.vagrantup.com/v2/cli/package.html).

Package the VM:

```
vagrant package --output trusty32 --include sail.sh --vagrantfile Vagrantfile
```

Upload the packaged box to S3 or somewhere on the cloud.

To use it, follow [1. Use a Pre-Built _Linux_ (Vagrant) Box](#1-use-a-pre-built-linux-vagrant-box), and use your new link.
