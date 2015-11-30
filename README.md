# Rails Carrier

Vagrant box for Rails development.


## Introduction

Let's set up a Ruby on Rails development environment on your machine (OS X or Windows)!

Things to note before we begin:

- For viewing/editing files, please download and use [Atom](https://atom.io/) or [Sublime Text Editor](http://www.sublimetext.com/2).
- Please feel free to report any problems to [GitHub Issues](https://github.com/jollygoodcode/rails-carrier/issues) or [email us](mailto: hello@jollygoodcode.com).

----

Let's get started!

Ruby on Rails runs better in a *nix environment, so we'll use __VirtualBox__ and __Vagrant__
to install __Linux__ on your machine.

### Install [VirtualBox](https://www.virtualbox.org)

[Download for your platform](https://www.virtualbox.org/wiki/Downloads),
then run the Installer and follow the instructions.

### Install [Vagrant](https://www.vagrantup.com)

[Download for your platform](https://www.vagrantup.com/downloads.html),
then run the Installer and follow the instructions.

### Install Git

#### Are you on Mac or Linux?

Git already comes pre-installed in your machine.

Verify by opening your Terminal and type:

```
$> git --version
git 2.2.1
```

You're good to move on if that command works. Skip to "[What's Next?](#whats-next)"

#### Are you on Windows?

Download [Git for Windows](https://git-scm.com/download/win).

Run the installer, and choose the following options where appropriate (use default options for the rest):

##### _Adjusting your PATH environment_

Choose option `Use Git and optional Unix tools from the Windows Command Prompt`.

##### _Configuring the line ending conversions_

Choose option `Checkout as-is, commit Unix-style line endings`.

### What's Next?

At this point, you have the following options:

1. (~ 10 min) Download a pre-built _Linux_ (Vagrant) box. ([Jump to instructions](#1-use-a-pre-built-linux-vagrant-box))
2. (~ 30 mins) Build a _Linux_ (Vagrant) box from scratch. ([Jump to instructions](#2-build-a-linux-vagrant-box-from-scratch))

----

## 1. Use a Pre-Built _Linux_ (Vagrant) Box

> _This should take about 10 min or less._ [See sample log](1-sample.log).

Open up your Terminal.

For Mac/Linus users, find the Terminal app.

For Windows users, click on Windows Start and type "cmd" in the "Search programs and files" search field.
Open `cmd.exe`. That's the Terminal equivalent in Windows.

Create and change into into a directory which you'll be using for all of your coding needs, e.g. `~/workshop/` or `C:\workshop`

```
$> mkdir workshop
$> cd workshop
```

Download our pre-built _Linux_ (Vagrant) box - Ubuntu 14.04, Ruby 2.2.3 and Rails 4.2.5.

**[Troubleshooting] Are you sitting behind a proxy server? [Set your `HTTP_PROXY` env variable](#http_proxy).**

```
$> vagrant box add https://s3-ap-southeast-1.amazonaws.com/jollygood-courses/trusty64 --name jgc/trusty64
```

Init a `Vagrantfile` from the downloaded Vagrant box.

```
$> vagrant init jgc/trusty64
```

**[Troubleshooting] Are you sitting behind a proxy server? [Set up `vagrant_proxy`](#vagrant-proxy).**

In the directory, type the following to bring up the Virtual Machine for Ubuntu 14.04.

```
$> vagrant up
```

SSH into the VM.

```
$> vagrant ssh
```

You're almost there! [Verify Everything Works](#verify-everything-works).

----


## 2. Build a _Linux_ (Vagrant) Box from Scratch

> _This should take about an hour or less._

First, you'll need to _install_ Linux on your machine using VirtualBox and Vagrant.

Once we have _Linux_ setup on your machine, we will then proceed to set up a Virtual Machine for Rails development.

### Setup a Virtual Machine for Ubuntu 14.04

Open up your Terminal.

For Mac/Linus users, find the Terminal app.

For Windows users, click on Windows Start and type "cmd" in the "Search programs and files" search field.
Open `cmd.exe`. That's the Terminal equivalent in Windows.

Create and change into into a directory which you'll be using for all of your coding needs, e.g. `~/workshop/` or `C:\workshop`

```
$> mkdir workshop
$> cd workshop
```

In the directory, type the following to setup a `Vagrantfile` for Ubuntu 14.04.

**[Troubleshooting] Are you sitting behind a proxy server? [Set your `HTTP_PROXY` env variable](#http_proxy).**

```
$> vagrant init jgc/trusty64
```

Open up the `Vagrantfile` in a text editor and edit line 25 (delete `#` and update ports).

```
config.vm.network "forwarded_port", guest: 3000, host: 3000
```

**[Troubleshooting] Are you sitting behind a proxy server? [Set up `vagrant_proxy`](#vagrant-proxy)**

In the directory, type the following to bring up the Virtual Machine for Ubuntu 14.04.

Basically, it will use the config we already have in `sail.sh` to install the necessary on the VM.

Take a look at [`sail.sh`](https://github.com/jollygoodcode/rails-carrier/blob/master/sail.sh) to see what we have included in the VM.

```
$> vagrant up
```

Wait for `vagrant up` to be completed (~ 10 mins), then SSH into the VM:

```
$> vagrant ssh
```

You're almost there! [Verify Everything Works](#verify-everything-works).

----


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
Loading development environment (Rails 4.2.5)
2.2.3 :001 > Workshop.count
   (0.2ms)  SELECT COUNT(*) FROM "workshops"
 => 3
2.2.3 :002 > Workshop.pluck(:title)
   (0.3ms)  SELECT "workshops"."title" FROM "workshops"
 => ["Beginner Ruby on Rails", "Intermediate Ruby on Rails", "Advance Ruby on Rails"]
2.2.3 :003 > exit
```

Verify that Rails server is working.

```
/vagrant/workshop_app $> rails server --bind 0.0.0.0
=> Booting WEBrick
=> Rails 4.2.5 application starting in development on http://0.0.0.0:3000
=> Run `rails server -h` for more startup options
=> Ctrl-C to shutdown server
```

Open up your browser and go to `http://localhost:3000`. You should see the _Welcome_ page:

![Rails 4.2 welcome page](/images/welcome.png)

That's it! You're all done! Start writing some awesome apps now!


## Troubleshooting

### Behind a Proxy Server

Are you sitting behind a proxy server?

You'll need to set the `HTTP_PROXY` environment variable and use `vagrant-proxy`.

#### `HTTP_PROXY`

In your terminal, set the `HTTP_PROXY`:

```
# Windows
$> set HTTP_PROXY=http://<user>:<password>@<proxy.domain.com>:<port>

# OS X
$> export HTTP_PROXY=http://<user>:<password>@<proxy.domain.com>:<port>
```

Note that this setting would be deleted as soon as you close the terminal.

Make this permanent by setting it in `Advanced System Settings` (Windows) or `.bashrc` (OS X).

#### `vagrant-proxy`

Install the plugin:

```
$> vagrant plugin install vagrant-proxyconf
```

Open up the `Vagrantfile` in a text editor and add this to the end of the file:

```ruby
Vagrant.configure("2") do |config|
  if Vagrant.has_plugin?("vagrant-proxyconf")
    config.proxy.http     = "http://<user>:<password>@<proxy.domain.com>:<port>/"
    config.proxy.https    = "http://<user>:<password>@<proxy.domain.com>:<port>/"
    config.proxy.no_proxy = "localhost,127.0.0.1,.example.com"
  end
end
```
