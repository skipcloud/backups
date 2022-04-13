# Backup Drive

This drive is primarily for backups

## Script

The script `backup.sh`

## Restoring Data

The process is outlined [in this walkthrough](https://help.ubuntu.com/community/BackupYourSystem/TAR)
but if that link should die someday here are the basic steps.

1. Run Ubuntu from a pen drive.
2. Partition target drive, minimum of two (`/` and `/home`).
3. Format partitions with ext4 fs.
4. Mount paritions and `backups` drive.
5. Run `backup.sh restore` to restore data to the various paritions.
6. Replace directories that were excluded when creating the archive.
7. Recreate grub config by installing this tool by running this code:

```bash
sudo apt-add-repository ppa:yannubuntu/boot-repair
sudo apt-get update
sudo apt-get install boot-repair -y
boot-repair
```

8.
