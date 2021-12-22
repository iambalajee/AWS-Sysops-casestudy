#!/bin/bash
sudo echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC5hMnTTfZcQSOtrhBSnM5cAxrdA8ZmVIaX0aq5wofnbrZEEo2OFFjYTxylWxEeqencp3PNB5rx5ylmda9FjHOw7mAuQ0HkrnJJFqj71EgqxPX4lJyz6CO/cizqlA5UfQDPFGj5cLGnQKUGiluJdNzygjIo/W+O3jJPKluE9igO50+iVVWhMAHsUgNY9Y9yNTOe+pBrzsJgrcLWvlMDjbXC6ksm4oaGomSdgy6MmAQfhCJ3WfXUKAKPUA6biBni4GGoVfX8FgWTbcc6g6YKQWCackOF8XZxccILAhYYQ5KYXbADF8WH62ZSgS4O5jB6wfh3MVoZMTmEqWqxLhluyjIT ubuntu@ip-10-0-1-221" >> /home/ubuntu/.ssh/authorized_keys
cd /home/ubuntu/
sudo apt-get update
sudo apt-get install unzip tree
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
sudo apt-get install -y python