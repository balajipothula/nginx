#!/bin/bash

# Author      : BALAJI POTHULA <balan.pothula@gmail.com>,
# Date        : 14 September 2017,
# Description : nginx cmds.

# Shut down gracefully.
sudo ./nginx -s quit

# Shut down immediately.
sudo ./nginx -s stop

# Reload config file.
sudo ./nginx -s reload

# Reopen log files.
sudo ./nginx -s reopen

# daemon file path.
/lib/systemd/system/nginx.service

# starting nginx service as daemon.
sudo systemctl start nginx.service

# enabling nginx service as daemon.
sudo systemctl enable nginx.service

# checking nginx started at boot time.
sudo systemctl is-enabled nginx.service

# checking nginx running or not.
sudo systemctl status nginx.service
