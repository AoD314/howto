# remove all logs

```
sudo journalctl --rotate
sudo journalctl --vacuum-time=1s
```
# config short logs

edit `/etc/systemd/journald.conf`
```
[Journal]
Compress=yes
SystemMaxUse=64M
SystemMaxFileSize=4
```
and then restart journald
```
$ systemctl restart systemd-journald
```
