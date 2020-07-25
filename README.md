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

After tried k8s I decided to have a look at K3S es a kubernetes cluster, because of the restrictions of the raspberry pies.
