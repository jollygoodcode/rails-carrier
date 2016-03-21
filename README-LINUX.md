# LINUX

Let's get started!

Ruby on Rails runs better in a *nix environment, so we'll use __VirtualBox__ and __Vagrant__
to install __Linux__ on your machine.

## Table of Contents

- [Install VirtualBox](#install-virtualbox)
- [Install Vagrant](#install-vagrant)
- [Install Git](#install-git)
- [Use a Pre-Built Linux (Vagrant) Box](#use-a-pre-built-linux-vagrant-box)
- [Verify Everything Works!](#verify-everything-works)

## Install [VirtualBox](https://www.virtualbox.org)

[Download for Linux](https://www.virtualbox.org/wiki/Downloads),
then run the Installer and follow the instructions.

## Install [Vagrant](https://www.vagrantup.com)

[Download for Linux](https://www.vagrantup.com/downloads.html),
then run the Installer and follow the instructions.

## Install Git

Git already comes pre-installed on Linux.

Verify by opening your Terminal and type:

```
$> git --version
git version 2.7.2
```

You're good to move on if that command works.

## Use a Pre-Built _Linux_ (Vagrant) Box

> _This should take about 10 min or less._ [See sample log](sample.log).

Open up your Terminal.

Create and change into into a directory which you'll be using for all of your coding needs, e.g. `~/workshop/`:

```
$> mkdir workshop
$> cd workshop
```

Download our pre-built _Linux_ (Vagrant) box - Ubuntu 14.04, Ruby 2.3.0 and Rails 4.2.5.1.

[First check you're using 32-bit / 64-bit machine](http://superuser.com/questions/770554/check-if-my-machine-is-64-bit-capable-on-linux-ubuntu). Otherwise, just follow the instructions for a 32-bit machine.

```
# For 32-bit box. Suitable for most systems.
$> vagrant box add https://s3-ap-southeast-1.amazonaws.com/jollygood-courses/trusty32 --name jgc/trusty32

# OR

# For 64-bit box. Pick this only if you are sure that you are using a 64-bit machine.
$> vagrant box add https://s3-ap-southeast-1.amazonaws.com/jollygood-courses/trusty64 --name jgc/trusty64
```

Init a `Vagrantfile` from the downloaded Vagrant box.

```
# For 32-bit box.
$> vagrant init jgc/trusty32

# OR

# For 64-bit box.
$> vagrant init jgc/trusty64
```

In the directory, type the following to bring up the Virtual Machine for Ubuntu 14.04.

```
$> vagrant up
```

SSH into the VM.

```
$> vagrant ssh
```

You're almost there!

## Verify Everything Works!

Go to the synced folder.

```
$> cd /vagrant
```

Clone an existing GitHub repository.

```
/vagrant $> git clone https://github.com/jollygoodcode/workshop_app
```

Go into the cloned repository.

```
/vagrant $> cd workshop_app
```

Setup Rails app, migrate database and create some seed data:

```
/vagrant/workshop_app $> bin/setup
```

Verify that Rails console is working.

```
/vagrant/workshop_app $> rails console
Loading development environment (Rails 4.2.5.1)
2.3.0 :001 > Workshop.count
   (0.2ms)  SELECT COUNT(*) FROM "workshops"
 => 3
2.3.0 :002 > Workshop.pluck(:title)
   (0.3ms)  SELECT "workshops"."title" FROM "workshops"
 => ["Beginner Ruby on Rails", "Intermediate Ruby on Rails", "Advance Ruby on Rails"]
2.3.0 :003 > exit
```

Verify that Rails server is working.

```
/vagrant/workshop_app $> rails server --bind 0.0.0.0
=> Booting WEBrick
=> Rails 4.2.5.1 application starting in development on http://0.0.0.0:3000
=> Run `rails server -h` for more startup options
=> Ctrl-C to shutdown server
```

Open up your browser and go to <http://localhost:3000>. You should see the _Welcome_ page:

![Rails 4.2 welcome page](/images/welcome.png)

That's it! You're all done!

Start writing some awesome apps now!
