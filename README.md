
The architectures supported by this image are:
| Architecture | Tag |
| :----: | --- |
| x86-64 | amd64-latest |
| arm64 | arm64v8-latest |
| armhf | arm32v7-latest |
## Usage

```
docker create \
  --name=FlexTV \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/London \
  -p 80:80 \
  -v <path to data>:/config \
  --restart unless-stopped \
  digitalhigh/FlexTV
### docker-compose

Compatible with docker-compose v2 schemas.

```
---
version: "2"
services:
  FlexTV:
    image: digitalhigh/FlexTV
    container_name: FlexTV
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Europe/London
    volumes:
      - <path to data>:/config
    ports:
      - 80:80
    restart: unless-stopped
```

## Parameters

Container images are configured using parameters passed at runtime (such as those above). These parameters are separated by a colon and indicate `<external>:<internal>` respectively. For example, `-p 8080:80` would expose port `80` from inside the container to be accessible from the host's IP on port `8080` outside the container.

| Parameter | Function |
| :----: | --- |
| `-p 80` | WebUI |
| `-e PUID=1000` | for UserID - see below for explanation |
| `-e PGID=1000` | for GroupID - see below for explanation |
| `-e TZ=Europe/London` | Specify a timezone to use EG Europe/London. |
| `-v /config` | Where FlexTV should store its files. |

## User / Group Identifiers

When using volumes (`-v` flags) permissions issues can arise between the host OS and the container, we avoid this issue by allowing you to specify the user `PUID` and group `PGID`.

Ensure any volume directories on the host are owned by the same user you specify and any permissions issues will vanish like magic.

In this instance `PUID=1000` and `PGID=1000`, to find yours use `id user` as below:
```
  $ id username
    uid=1000(dockeruser) gid=1000(dockergroup) groups=1000(dockergroup)
```
&nbsp;
## Application Setup

Find the web interface at `<your-ip>:80` , set apps you wish to use with FlexTV via the webui.
More info:- [FlexTV](https://github.com/d8ahazard/FlexTV)



## Support Info

* Shell access whilst the container is running: `docker exec -it FlexTV /bin/bash`
* To monitor the logs of the container in realtime: `docker logs -f FlexTV`

* container version number 

  * `docker inspect -f '{{ index .Config.Labels "build_version" }}' FlexTV`

* image version number
  * `docker inspect -f '{{ index .Config.Labels "build_version" }}' digitalhigh/FlexTV`

## Updating Info

 
## Updating

To update FlexTV, just restart the container.

+ **25.04.19:** Initial release.
