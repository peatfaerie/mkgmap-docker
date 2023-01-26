# mkgmap-docker
Docker image with mkgmap based on Eclipse Temurin JRE 19

This is a JRE docker image with mkgmap and gpsbabel cli, with mkgmap as an entrypoint.

Example usage:
```
docker run --rm -i peatfaerie/mkgmap -c config.txt typ.txt input.osm
```
