## Introduction

Let's set up a Ruby on Rails development environment on your machine!

First, you'll need to _install_ Linux on your machine using VirtualBox and Vagrant.

Once we have _Linux_ setup on your machine, we will then proceed to install the following in _Linux_:

- Git
- Ruby Version Manager (RVM)
- Ruby
- Rails
- PostgreSQL
- nodejs

(For viewing/editing files, please download and use [Sublime text editor](http://www.sublimetext.com/2).)

Follow the steps below closely and please feel free to report any problems to:

- [GitHub Issues](https://github.com/jollygoodcode/workshop_setup/issues)
- [Email](mailto: winston@jollygoodcode.com)

This should take about an hour or less. :)

---

## Install [VirtualBox](https://www.virtualbox.org/)

Download [for your platform](https://www.virtualbox.org/wiki/Downloads ),
then run the installer and follow the instructions.

## Install [Vagrant](http://www.vagrantup.com/)

Download [for your platform](http://www.vagrantup.com/downloads.html),
then run the Installer and follow the instructions.

## Setup a Virtual Machine for Ubuntu 12.04

Open up your terminal and change into a directory which you'll be using for all of your coding needs, e.g. `~/workshop/` or `C:\workshop`

```
$> cd workshop
```

In the directory, type the following to setup a `Vagrantfile` for Ubuntu 12.04.

```
$> vagrant init hashicorp/precise32
```

Open up the `Vagrantfile` in a text editor and edit line 23 (delete `#` and update ports).

```
config.vm.network "forwarded_port", guest: 3000, host: 3000
```

In the directory, type the following to bring up the Virtual Machine for Ubuntu 12.04.

```
$> vagrant up
```

## Configure the Virtual Machine

SSH into the VM.

```
$> vagrant ssh
```

Update the VM.

```
$> sudo apt-get update
```

Install Git.

```
$> sudo apt-get install git
```

Install RVM.

```
$> sudo apt-get install curl
...
$> \curl -sSL https://get.rvm.io | bash
...
$> source /home/vagrant/.rvm/scripts/rvm
...
$> rvm --help
```

Install other dependencies with RVM.

```
$> rvm requirements
```

Install Ruby 2.1 and update Bundler.

```
$> rvm install 2.1
...
$> echo 'gem: --no-ri --no-rdoc' > ~/.gemrc
$> gem update bundler
$> gem cleanup
```

Install Rails.

```
$> gem install rails
```

Install PostgreSQL.

- Setup locale for Postgresql

```
$> export LANGUAGE="en_US.UTF-8"
$> export LANG="en_US.UTF-8"
$> export LC_ALL="en_US.UTF-8"
$> locale-gen en_US.UTF-8
```

- Install PostgreSQL

```
$> sudo apt-get install postgresql libpq-dev
```

- Create `vagrant` role, and type `y` when prompted 'Shall the new role be a superuser?'

```
$> sudo su postgres
$> createuser vagrant
```

Install NodeJS (for Rails Assets).

```
$> sudo apt-get install nodejs
```


## Verify Everything Works!

Go to the synced folder.

```
$> cd /vagrant
```

Clone an existing GitHub repository.

```
/vagrant $> git clone https://github.com/jollygoodcode/workshop_app
```

Set up the repository.

```
/vagrant $> echo '2.1'          > workshop_app/.ruby-version
/vagrant $> echo 'workshop_app' > workshop_app/.ruby-gemset
/vagrant $> cd workshop_app
```

Setup Rails app.

```
/vagrant/workshop_app $> bundle
/vagrant/workshop_app $> rake db:create db:migrate db:seed
```

Verify that Rails console is working.

```
/vagrant/workshop_app $> rails console
Loading development environment (Rails 4.1.0)
2.1.1 :001 > Workshop.count
   (1.9ms)  SELECT COUNT(*) FROM "workshops"
 => 3
2.1.1 :002 > Workshop.pluck(:title)
   (0.9ms)  SELECT "workshops"."title" FROM "workshops"
 => ["Beginner Ruby on Rails", "Intermediate Ruby on Rails", "Advance Ruby on Rails"]
2.1.1 :003 > exit
```

Verify that Rails server is working.

```
/vagrant/workshop_app $> rails server
=> Booting WEBrick
=> Rails 4.1.0 application starting in development on http://0.0.0.0:3000
=> Run `rails server -h` for more startup options
=> Notice: server is listening on all interfaces (0.0.0.0). Consider using 127.0.0.1 (--binding option)
=> Ctrl-C to shutdown server
```

Open up your browser and go to `http://localhost:3000`. You should see the _Welcome_ page.

That's it! Done! All's good!
