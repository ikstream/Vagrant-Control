# Vagrant Control Scripts

The repository contains a systemd unit to:
- suspend running Boxes on shutdown
- resume save Boxes on startup

and a scipt to show the current status and provider of all boxes


## Usage
To use the service, change the `<vagrant user>` to your actual vagrant user name
Afterwards copy the systemd unit to `/etc/sysmted/user/` and enable and start the service
```
# cp handle_vagrant.service /etc/systemd/user
# cp resume_vagrant.sh /usr/local/bin/resume_vagrant
# cp suspend_vagrant.sh /usr/local/bin/suspend_vagrant
# systemctl enable /etc/systemd/user/handle_vagrant.service --now
# systemctl start handle_vagrant.service --now
```

To use the update script copy it and run it with a username
```
# cp update_status /usr/local/bin
# update_status <vagrant user>
```

## Output

The output of the scripts is prefixed with `Vagrant-Control` in journalctl

