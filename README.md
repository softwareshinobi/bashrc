root@urus:~# cd /tmp
root@urus:/tmp# git clone https://github.com/softwareshinobi/bashrc.git
Cloning into 'bashrc'...
remote: Enumerating objects: 26, done.
remote: Counting objects: 100% (26/26), done.
remote: Compressing objects: 100% (24/24), done.
remote: Total 26 (delta 9), reused 0 (delta 0), pack-reused 0 (from 0)
Receiving objects: 100% (26/26), 11.66 KiB | 11.67 MiB/s, done.
Resolving deltas: 100% (9/9), done.
root@urus:/tmp# cd bashrc/
root@urus:/tmp/bashrc# ls
Dockerfile  compose.yaml  install.sh
root@urus:/tmp/bashrc# sudo bash install.sh 
System-wide aliases installed to /etc/profile.d/softwareshinobi.bashrc.sh
root@urus:/tmp/bashrc# 


root@urus:/tmp/bashrc# ls
Dockerfile  compose.yaml  install.sh
root@urus:/tmp/bashrc# sudo bash install.sh 
System-wide aliases installed to /etc/profile.d/softwareshinobi.bashrc.sh
root@urus:/tmp/bashrc# source /etc/profile.d/softwareshinobi.bashrc.sh
root@urus:/tmp/bashrc# r
