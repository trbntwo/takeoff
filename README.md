# takeoff

## about

`takeoff` is a script to get Fedora Linux up and running as quickly as possible. Fedora has basically good default settings, but due to Red Hat's fear of lawsuits, additional package sources like RPM Fusion and Flathub are missing. Since Fedora 38, Flathub can be switched on in the setup screen, but with RPM Fusion this can only be done with Steam and the NVIDIA drivers. To avoid this inconsistency, this script can take over these steps. Furthermore, the script can optionally install and remove other components, as well as adjust settings.

## quickstart

**DISCLAIMER FOR SILVERBLUE USERS:**
Under Silverblue only the options of the script can be used which do not install packages with `dnf`

```
git clone https://github.com/trbntwo/takeoff.git
```
```
cd takeoff/
```
```
chmod u+x takeoff.sh
```
```
./takeoff.sh <options>
```

The short options CAN'T be chained together, all options have to be on their own
```
./takeoff.sh -oa         # won't work
```
```
./takeoff.sh -o -a       # will work
```

## prerequisites

If you have just set up your system, please run an update via 
```
sudo dnf up -y
```
and reboot when it is done.
If a system has just been set up, there are often up to 1GB of updates available, these should be installed in any case, as kernel updates are also often included. These in particular are indispensable when installing the nvidia drivers, but updates are also a good idea in general.

## options
To see the options, please look into [takeoff.sh](./takeoff.sh)