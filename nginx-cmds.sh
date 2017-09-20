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
