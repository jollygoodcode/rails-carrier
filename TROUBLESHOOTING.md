## Troubleshooting

### SSL Certificate

Did you encounter a SSL problem when running the `vagrant box add ...` command?

Try adding `--insecure` to the end of the command:

```
# For 32-bit box. Suitable for most systems.
$> vagrant box add https://s3-ap-southeast-1.amazonaws.com/jollygood-courses/trusty32 --name jgc/trusty32 --insecure

# OR

# For 64-bit box. Pick this only if you are sure that you are using a 64-bit machine.
$> vagrant box add https://s3-ap-southeast-1.amazonaws.com/jollygood-courses/trusty64 --name jgc/trusty64 --insecure
```

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
