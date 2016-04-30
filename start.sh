#!/bin/bash

chmod 400 /etc/rsyncd.secrets

/usr/bin/rsync --no-detach --daemon --config /etc/rsyncd.conf
