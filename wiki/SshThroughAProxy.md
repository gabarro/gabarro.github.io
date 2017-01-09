---
layout: base
title: SSH though a proxy
---

You are at hostA, have ssh access to hostB and want to connect to hostC.  Unfortunately, hostC only accepts connections from hostB.

Write the following in `.ssh/config`

    Host hostC
      ProxyCommand ssh userB@hostB -W %h:%p

From now on, any ssh connection from hostA to hostC will be done using hostB as a proxy. So now

    hostA$ ssh userC@hostC

just works.

Seen here: http://superuser.com/a/170592
