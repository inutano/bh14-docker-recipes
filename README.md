Dockerfiles for benchmarking on #BioHack14
==============

A set of instructions and Dockerfiles to build containers for [dev-setup by joejimbo](https://github.com/joejimbo/dev-setup).

- Elasticsearch
- Hadoop
- 4store
- Jena
- Virtuoso
- RDF-tools

### Elasticsearch

Official docker container by [dockerfile](https://registry.hub.docker.com/u/dockerfile/) is on the [public Docker Hub Repository](https://registry.hub.docker.com/u/dockerfile/elasticsearch/).

```
docker run -d -p 9200:9200 -p 9300:9300 dockerfile/elasticsearch
```

### Hadoop

Public docker container by [sequenceiq](http://sequenceiq.com) is on the [public Docker Hub Repository](https://registry.hub.docker.com/u/sequenceiq/hadoop-docker/).

```
docker run -it sequenceiq/hadoop-docker /etc/bootstrap.sh -bash
```

### 4store

```
docker run -it inutano/4store bash
```

### Jena

```
docker run -it inutano/jena bash
```
### Virtuoso

```
docker run -it -p 8890:8890 inutano/virtuoso
```

### RDF-tools

```
docker run -it inutano/rdf-tools bash
```
