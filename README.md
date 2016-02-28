Docker swift image
==================

This image takes a swift URL as argument and outputs the object to a named pipe (default: /tmp/share/pipe) so that it can be used in another container.

Usage:
------

```
$ docker run -name swift -e OS_AUTH_URL=$OS_AUTH_URL -e OS_TENANT_NAME=$OS_TENANT_NAME -e OS_USERNAME=$OS_USERNAME -e OS_PASSWORD=$OS_PASSWORD camptocamp/swift https://swift.example.com/mycontainer/myobject

$ docker run --volumes-from swift --entrypoint "sh -c" --command "cat /tmp/share/pipe > psql -U postgres" postgres:9.5 
```
