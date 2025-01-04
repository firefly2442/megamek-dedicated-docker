# megamek-dedicated-docker

## Introduction

A [Megamek](https://megamek.org/) dedicated server in a Docker container.

## Requirements

* Docker (with buildkit enabled, see `/etc/docker/daemon.json`)
* docker compose

## Installation and Setup

Copy `.env-copy` to `.env` and edit as needed.

Adjust the `Dockerfile` for whatever version of Megamek you wish to run.

Bring up all the services via Docker

```shell
docker compose up -d --build
```

Launch a local copy of Megamek and join via your corresponding IP address and port.

## Debugging

```shell
docker logs -f <id>
```

## Shutdown

```shell
docker compose down -v
```

## References

* [https://megamek.org/wiki/ded_servers.html](https://megamek.org/wiki/ded_servers.html)
