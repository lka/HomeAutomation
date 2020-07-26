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

I have no idea why the file .gitignore doesn't work when I add entries after the files that it should ignore.


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