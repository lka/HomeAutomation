# HomeAutomation

My Home Automation uses Home Assistant on Raspberry Pi to do the tracking of my cell phone and to do the garden watering with a second RaspBerry Pi.

## VSCode

I found VSCode useful to edit the configuration of my little cloud and did some configuration for it.

I installed VSCode but it was not able to use a terminal because I don't want to work as Administrator.

---
    For a working terminal added hash rule for
    C:\Windows\system32\conhost.exe
    to ct-Restrictor!!!
---

Next I wanted to use kubernetes extension to control the little cluster from my windows box.

Installed Visual Studio Code Kubernetes Tools as extension in VSCode and found a helm chart with version 2.2

Downloaded windows version of helm from https://github.com/helm/helm/releases and copied the helm.exe to C:\Users\\\<user>\\\.vs-kubernetes\tools\helm\windows-amd64. Now I can use Version 3.3 without tiller do do happy helming.

---

I had no idea why the file .gitignore doesn't work when I add entries after the files that it should ignore.
Git ignores files that are already in the repository. So you have to remove the file first  with "git rm \<file\>" then you can add it to the .gitignore and push this to repo.

## K3S

After tried k8s I decided to have a look at K3S as a kubernetes cluster, because of the restrictions of the raspberry pies.

The base is hypriot-OS flashed on a 64 Mbit card. Then configured to get access via ssh and correct keyboard layout and language settings.

K3S cannot work with nftables which is installed in Raspbian Buster by default, so you have to switch to legacy iptables by executing the script PiAtMaster/k3s/iptables.sh.

I want to have my own configuration for local-storage and the newest version of traefik, so I don't install them by default. Use the script PiAtMaster/k3s/createOrUpdateK3S.sh to install k3s master.

### Kubernetes-Dashboard

To upgrade the Dashboard you can use PiAtMaster/kubernetes-dashboard/upgradeDashboard.sh and to get the necessary token for access to the Dashboard you can use PiAtMaster/kubernetes-dashboard/get-kubernetes-token.sh.

### Local-Storage

Home Assistant uses SQLight Version 3.x by default and this database (I think no database) doesn't perform well on NFS Storage. So I decided to use a Raspberry Pi 4 with a USB HDD on USB 3 Port and on this HDD I placed the local-storage for the pods. See PiAtMaster/localStorage/create_localStorage.sh.

For each node I created a nX-pvc.yaml and assigned it with 'kubectl apply -f nX-pvc.yaml' and labeled each node with 'kubectl label nodes nodeX disktype=nodeX-pv' where X is 1 .. 3.

### Traefik

Traefik is the ingress controller and load balancer used by k3s and it is installed by helm chart and the configuration values in PiAtMaster/traefik/values.yaml. There you can change the version and call install.sh or delete.sh or upgrade.sh.
The dashboard of traefik can be accesssed by http://192.168.178.45/dashboard/ 

### Home Assistant

Home assistant is installed with a helm chart and that can be controlled by values.yaml in PiAtMaster/hass.
It can be installed with install.sh or upgraded with upgrade.sh after changing the tag in values.yaml to the new version.
Be careful and read the upgrade notice before, last time there was a change of the database with no way back....

The configuration directory of home assistant is the local-storage defined before in the Local-Storage section.
You can find it in the master node at /media/usbdrive/pvc......long..description...local-path-pvc/
This directory is the directory, where you can do changes in configuration.yaml and other yaml files for home assistant.
This directory should be saved with a backup script....
