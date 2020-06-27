#!/bin/bash
sudo mkfs.ext4 /dev/xvdh
sudo mkdir /data
sudo mount /dev/xvdh /data
sudo chmod +w /etc/fstab
echo "sudo /dev/xvdh /data ext4 defaults 0 0" >> /etc/fstab