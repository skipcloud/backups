#!/usr/bin/env zsh

/home/skip/code/backup/backup >&2 > /var/log/backups/$(date +%Y-%m-%d).log
