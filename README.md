# geany in docker

Yes, it is a nod to "Geany in a lamp"...

## Description

I like **[`geany`](https://geany.org)** - it is not so resource-hungry like other IDEs (or electron based apps) but it also offers more than just an ordinary text editor and it is not so hard to learn like powerful **`emacs`** for example (maybe when I have time...).

But I also love **`Vim`** text editing and so geany has usability for me only with the **Vimode** plugin.

All and all what I wanted was a sane geany setup which I can take with me everywhere - at work or at home - without tedious setup.

My intentions were to build it from source but because Alpine already have packages and plugins including Vimode I decided to just install packages - maybe I will add building from source in the future.

## Usage

**You must have [`docker`](https://docker.com) installed (or its alternative like `podman`).**

If your system needs root's privilege to run docker then do this:

```
% alias docker="sudo docker"
```

or

```
% alias docker="podman"
```

### Overview
1. build the image
1. adjust `geany-in-docker.sh` script
1. install `geany-in-docker.sh` into your path somewhere
1. run it

### Build

You most likely just can run build script like this:

```
% ./build.sh
```

But if you wish to change or be explicit about user setup then you can do it like this:

```
% env USERNAME=osp USERGROUP=osp USER_UID=1000 USER_GID=1000 ./build.sh
```

### geany-in-docker.sh

You **should** change those few variables in `geany-in-docker.sh` to your liking, which are by default adjusted to me:

```
PROJECT_FILE_PATH=${HOME}/Projekty
DEVELOPER="Petr Ospalý"
COMPANY=
EMAIL=petr@ospalax.cz
INITIAL=osp
VERSION_TEMPLATE=1.0
YEAR_TEMPLATE="%Y"
DATE_TEMPLATE="%Y-%m-%d"
DATETIME_TEMPLATE="%d.%m.%Y %H:%M:%S %Z"
```

**But leave the rest...**

### Install it

I have my `~/bin` in my `PATH` so I can simply do this:

```
% cp -a geany-in-docker.sh ~/bin/geany
```

### Run it

Depends on how you have installed it but this will work always:

```
% ./geany-in-docker.sh
```

## Issues

I was unable to override GTK settings from within the container so be sure that your (**host**) system has full support for GTK3 otherwise your fonts can be messed up or you can have missing icons on buttons etc.

I have let more info in the `Dockerfile`, so look there if you are interested in this.
