# Backups

I finally have a dedicated harddrive for storing backups so I wrote some scripts to help me create and restore archives:

- `backup.sh`: for making backups of various partitions.
- `restore.sh`: for restoring data to partitions.

For more information on either script use the `--help` option. There is information on below on [how to restore data](#restoring-data) because I will definitely forget how to do it within a couple of weeks of writing this.

## Setting up cron job

TODO

## Restoring Data

The process is outlined [in this walkthrough](https://help.ubuntu.com/community/BackupYourSystem/TAR)
but if that link should die someday here are the basic steps.

1. Run Ubuntu from a pen drive.
2. Partition target drive, minimum of two (`/` and `/home`).
3. Format partitions with ext4 fs.
4. Mount paritions and `backups` drive.
5. Update the `/etc/fstab` file in the `root` patition with the new UUIDs.
6. Use `restore.sh` to restore data to the various paritions, check `restore.sh --help` for more information.
7. For the `root` drive run `restore.sh grub` to restore grub (duh).
8. If that fails then boot from the pen drive again and run the following command to try fixing the boot process on the drive and follow the instructions spat out by the `boot-repair` program:

```bash
sudo apt-add-repository ppa:yannubuntu/boot-repair
sudo apt-get update
sudo apt-get install boot-repair -y
boot-repair
```

9. If, on the off chance, you get stuck on the `grub` menu:
   1. run `ls` to see devices.
   2. run `ls <dev>/` to find the root partition.
   3. run `set root=<dev>` to set the root partition.
   4. run `linux /boot/vmlinuz-<linux-kernel-version>`
   5. run `initrd /initrd.img-<linux-kernel-version>`
   6. run `boot`
