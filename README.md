Dockerfiles for benchmarking on #BioHack14
==============

A set of instructions and Dockerfiles to build containers for [dev-setup by joejimbo](https://github.com/joejimbo/dev-setup).

- 4store
- Elasticsearch
- Hadoop
- Jena
- RDF-tools

### 4store

```
docker run -it inutano/4store bash
```

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

### Jena

```
docker run -it inutano/jena bash
```

### RDF-tools

```
docker run -it inutano/rdf-tools bash
```
