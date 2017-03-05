# simple_ip_service

What this is:
  A too-simple implementation of what pierre@meteor.com asked me for in my interview.

What this is not:
  Something resembling a real production-ready service (no load balancers, no scaling, one host only).

Prerequisites include a working setup of:
  Chef-DK
  Test-Kitchen
  VirtualBox

Basic setup:
  git clone <this repo>
  cd <this repo>
  berks install
  kitchen setup

For now, you have to log into the guest via 'kitchen login' to find out its IP.

TODO: 
  Everything

Ideas:
  Containerize
  Terraform

Cheers!
