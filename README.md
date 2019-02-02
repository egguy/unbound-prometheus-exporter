# unbound-prometheus-exporter
A container for unbound exporter

## Run the container

```bash
$ docker run -p 9167:9167 --network="host" -v /etc/unbound/:/etc/unbound/ egguy/unbound-prometheus-exporter:latest
```
