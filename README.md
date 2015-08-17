# docker-logentries
Docker image to follow any logs by logentries

Usage
=====

* `ACCOUNT_KEY` - Account key from logentries.com
* `HOST_KEY` - Host key generated before
* `HOST_NAME` - Set this if you need to name your host at Logentries
* `LOGTYPE` - Log Type (e.x. le:access, le:error, cassandra, ...)
* `LOGS` - actual string to follow (e.x. "/var/log/httpd/access*.log")

