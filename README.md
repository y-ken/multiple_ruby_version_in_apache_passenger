## Passenger4 comes running
## How to run multiple ruby version in single Apache 

The Passenger4 got support working with multiple ruby version for each virtualdomains etc...<br />
It is a sample to build multiple ruby environment with vagrant.

## Environment

Sample machine which you boot

* CentOS 6.4
* Apache 2
* Passenger4
* rbenv


## Usage

1. First, boot on your local machine.

  ```sh
  # Build machine
  $ vagrant up

  # login into the machine
  $ vagrant ssh
  ```

2. On inside your booted vagrant machine:

  ```sh
  $ curl -s -H "Host: ruby19.example.jp" http://127.0.0.1/ | grep exec_prefix
  "exec_prefix"=>"/root/.rbenv/versions/1.9.3-p545",

  $ curl -s -H "Host: ruby21.example.jp" http://127.0.0.1/ | grep exec_prefix
  "exec_prefix"=>"/root/.rbenv/versions/2.1.1",
  ```

