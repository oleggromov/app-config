# App configuration

This repository contains configuration files for some applications being run in `oleggromov.com` domain and maintained by Oleg Gromov.

**Likely you don't need anything from here!** Anyway, if the stuff found here draws your attention don't hesitate to ask any questions using *issues* or *email from my profile*.

## How to run a new version

- encrypt/decrypt secret files with `./scripts/encdec.sh` command
- pull the right images `docker-compose pull`
- create a data folder: `mkdir -p ~/counter-mysql-data`
- start new services `docker-compose up -d`
- login to mysql container and create databases if not yet created
- **HOW?** Clean up unused images from the HDD
- enjoy

## Basic config

Everything is *dockerized* so the server should be packed with `docker` and `docker-compose` packages before usage.

The only needed *open port* is `80` except `22` for ssh access.

- `nginx-frontend` routes all inbound queries to run (and accessible) locally services, with respect to domain names and whatsoever
- `conter-mysql` container serves the database needs for any number of `counter-app` instances
- `counter-app` is split in two parts:
	- `counter-app-test` works for test purposes and is open for public
	- `counter-app-live` works for me personally

### TODO

- close the registration for `counter-app-live`
