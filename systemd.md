# remove all logs

```
sudo journalctl --rotate
sudo journalctl --vacuum-time=1s
```
# config short logs

set /etc/systemd/journald.conf
```
SystemMaxUse=100M
```
and then restart journald
```
$ systemctl restart systemd-journald
```
