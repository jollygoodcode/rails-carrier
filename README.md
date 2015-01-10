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

## Install Git

### Are you on Windows?

Download [Git for Windows](http://msysgit.github.io/).

Run the installer, and choose the following options where appropriate:

#### _Adjusting your PATH environment_

Choose option `Use Git and optional Unix tools from the Windows Command Prompt`.

#### _Configuring the line ending conversions_

Choose option `Checkout as-is, commit Unix-style line endings`.

### Are you on Mac?

Move on. Nothing to see here. You already have Git in Mac.

## Install [VirtualBox](https://www.virtualbox.org/)

[Download for your platform](https://www.virtualbox.org/wiki/Downloads),
then run the installer and follow the instructions.

## Install [Vagrant](http://www.vagrantup.com/)

[Download for your platform](http://www.vagrantup.com/downloads.html),
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

Open up the `Vagrantfile` in a text editor and edit line 25 (delete `#` and update ports).

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

Update the Virtual Machine.

```
$> sudo apt-get update
```

Install Git.

```
$> sudo apt-get install -y git
```

Install RVM.

```
$> sudo apt-get install -y curl
...
$> gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
...
$> \curl -sSL https://get.rvm.io | bash -s stable
...
$> source /home/vagrant/.rvm/scripts/rvm
...
$> rvm --help
```

Install other dependencies with RVM.

```
$> rvm requirements
```

Install Ruby 2.2 and update Bundler.

Follow the instructions from `gem cleanup` to remove rubygems-bundler 1.4.2 and bundler 1.5.3.

```
$> rvm install 2.2
...
$> echo 'gem: --no-document' > ~/.gemrc
$> rvm @global do gem update bundler
$> rvm @global do gem cleanup
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

- Install PostgreSQL.

```
$> sudo apt-get install -y postgresql libpq-dev
```

- Create `vagrant` role, and type `Y` when asked 'Shall the new role be a superuser?'

```
$> sudo su postgres
$> createuser vagrant
...
$> exit
```

Install NodeJS (for Rails Assets).

```
$> sudo apt-get install -y nodejs
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
/vagrant $> echo 'ruby-2.2.0'   > workshop_app/.ruby-version
/vagrant $> echo 'workshop_app' > workshop_app/.ruby-gemset
/vagrant $> cd workshop_app
```

Setup Rails app.

```
/vagrant/workshop_app $> bin/setup
/vagrant/workshop_app $> bin/rake db:migrate db:seed
```

Verify that Rails console is working.

```
/vagrant/workshop_app $> rails console
Loading development environment (Rails 4.2.0)
2.2.0 :001 > Workshop.count
   (0.2ms)  SELECT COUNT(*) FROM "workshops"
 => 3
2.2.0 :002 > Workshop.pluck(:title)
   (0.3ms)  SELECT "workshops"."title" FROM "workshops"
 => ["Beginner Ruby on Rails", "Intermediate Ruby on Rails", "Advance Ruby on Rails"]
2.2.0 :003 > exit
```

Verify that Rails server is working.

```
/vagrant/workshop_app $> rails server
=> Booting WEBrick
=> Rails 4.2.0 application starting in development on http://127.0.0.1:3000
=> Run `rails server -h` for more startup options
=> Ctrl-C to shutdown server
```

Open up your browser and go to `http://localhost:3000`. You should see the _Welcome_ page:

![Rails 4.2 welcome page](/images/welcome.png)

That's it! Done! All's good!
