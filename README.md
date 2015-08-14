# docker-logentries
Docker image to follow any logs by logentries

Usage
=====

`ACCOUNT_KEY` - Account key from logentries.com
`LOGSET` - Name of Log Set
`LOGTYPE` - Log Type (e.x. le:access, le:error, cassandra, ...)
`LOGS` - actual string to follow (e.x. "/var/log/httpd/access*.log")

