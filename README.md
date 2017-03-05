# simple_ip_service

***What this is:***
  A too-simple implementation of what pierre@meteor.com asked me for in my interview.

***What this is not:***
  Something resembling a real production-ready service (no load balancers, no scaling, one host only).

Prerequisites include a working setup of:
  * Chef-DK
  * Test-Kitchen
  * VirtualBox

Basic setup:
  1. git clone this repo
  1. cd into this repo

  ```shell
  $ berks install
  $ kitchen setup
```

For now, you have to log into the guest via 'kitchen login' to find out its IP.

**Usage:**
```shell
$ curl -s http://<the Vagrant host-only IP>/
```

**TODO:**
  * EC2 Testing
  * SSL/Let's Encrypt (via certbot)

**Ideas for Improvements:**
  * Containerize
  * Terraform
  * DNS via cli53
  
Cheers!
