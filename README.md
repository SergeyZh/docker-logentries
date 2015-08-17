# docker-logentries
Docker image to follow any logs by logentries

Usage
=====

Let's assume you need to stream Nginx logs file from /mnt/logs/access.log to Logentries.

Register your host and logs before send logs to Logentries:
```
docker run -it --rm -v /mnt/logs:/mnt/logs -e ACCOUNT_KEY=<Your_account_key> \
   -e SERVICE_NAME=<Your_service_name> -e LOGS=/mnt/logs/access.log \
   sergeyzh/logentries

HOST_KEY is not set. Generating new...
Registered Test123 (8f1536e022bc)
name = Test123
hostname = 8f1536e022bc
key = xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
distribution = Red Hat
distver = CentOS release 6.7 (Final)

no logs

Will follow /mnt/logs/access.log as access.log
Don't forget to restart the daemon
  sudo service logentries restart
  Write down your host key. Exiting...
```

Now you can run container to follow your log file:
```
docker run -it --rm -v /mnt/logs:/mnt/logs -e ACCOUNT_KEY=<Your_account_key> \
   -e HOST_KEY=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx \
   sergeyzh/logentries

```

Useful commands
===============

Show config of your host on Logentries server:
```
docker run -it --rm -v /mnt/logs:/mnt/logs sergeyzh/logentries \
   le --account-key=<Your_account_key> --host-key=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx whoami
```

Add another log to follow:
```
docker run -it --rm -v /mnt/logs:/mnt/logs sergeyzh/logentries \
   le --account-key=<Your_account_key> --host-key=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx follow /mnt/logs/error.log
```

Environment variables
=====================

* `ACCOUNT_KEY` - Account key from logentries.com
* `HOST_KEY` - Host key generated before
* `SERVICE_NAME` - Set this if you need to name your service at Logentries
* `LOGTYPE` - Log Type (e.x. access, error, cassandra, ...)
* `LOGS` - actual string to follow (e.x. "/mnt/logs/access*.log")

