
## Local Repository Path

* [/opt/demo-os/demo-repository/x86_64](x86_64)

## Config

Config /etc/pacman.conf

``` ini
[demo-os]
SigLevel = Optional TrustAll
Server = file:///opt/demo-os/demo-repository/$arch
#Server = file:///opt/demo-os/demo-repository/x86_64
```
