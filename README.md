## How to execute multiple versions of ruby in one Apache Passenger 

The Passenger4 got support working with multiple ruby version for each virtualdomains etc...<br />
It is a sample to build multiple ruby environment with vagrant.

### Environment

It is a sample machine environment on building with `vagrant up` has done.

* CentOS 6.4
* Apache 2.2.15
* Phusion Passenger 4.0.41
* rbenv has installed in `/root/.rbenv`
  * Ruby 1.9.3-p545
  * Ruby 2.1.1

### Usage

1. First, boot vagrant virtual machine on your local machine.

  ```sh
  # Build machine
  $ vagrant up

  # log-in the machine
  $ vagrant ssh
  ```

2. Log-in the vm and check the ruby version with curl

  ```sh
  $ curl -s -H "Host: ruby19.example.jp" http://127.0.0.1/ | grep exec_prefix
  "exec_prefix"=>"/root/.rbenv/versions/1.9.3-p545",

  $ curl -s -H "Host: ruby21.example.jp" http://127.0.0.1/ | grep exec_prefix
  "exec_prefix"=>"/root/.rbenv/versions/2.1.1",
  ```

### QuickGuide

The key point is defineing `PassengerDefaultRuby` option as global in `passenger.conf`, and set `PassengerRuby` option for each VirtualHost.

```xml
$ cat /etc/httpd.d/conf/passenger.conf
LoadModule passenger_module /root/.rbenv/versions/2.1.1/lib/ruby/gems/2.1.0/gems/passenger-4.0.41/buildout/apache2/mod_passenger.so<IfModule mod_passenger.c>  PassengerRoot /root/.rbenv/versions/2.1.1/lib/ruby/gems/2.1.0/gems/passenger-4.0.41  PassengerDefaultRuby /root/.rbenv/versions/2.1.1/bin/ruby</IfModule>Header always unset "X-Powered-By"Header always unset "X-Rack-Cache"Header always unset "X-Content-Digest"```
```xml
$ cat /etc/httpd.d/conf/virtualhosts.confNameVirtualHost *:80<VirtualHost *:80>   ServerName ruby19.example.jp   DocumentRoot /var/www/ruby19.example.jp/public   <Directory /var/www/ruby19.example.jp/public>     # This relaxes Apache security settings.     AllowOverride all     # MultiViews must be turned off.     Options -MultiViews   </Directory>   AllowEncodedSlashes on   PassengerAllowEncodedSlashes on   PassengerRuby /root/.rbenv/versions/1.9.3-p545/bin/ruby   LimitRequestBody 41943040</VirtualHost><VirtualHost *:80>   ServerName ruby21.example.jp   DocumentRoot /var/www/ruby21.example.jp/public   <Directory /var/www/ruby21.example.jp/public>     # This relaxes Apache security settings.     AllowOverride all     # MultiViews must be turned off.     Options -MultiViews   </Directory>   AllowEncodedSlashes on   PassengerAllowEncodedSlashes on   PassengerRuby /root/.rbenv/versions/2.1.1/bin/ruby   LimitRequestBody 41943040</VirtualHost>```

### Article

* https://coderwall.com/p/x2_z4a
* http://y-ken.hatenablog.com/entry/how-to-use-multiple-ruby-version-in-one-apache-passenger
