# Building a multi Broker/Controller Confluent Cluster

## Overview

Busy with another blog and had some issues with my Cluster, running out of steam, well guess thats possible if you throw 100GB data at it in 10min, producing to topic, doing some conversion and then outputting to cluster again ;)

Figured I'd see whats involved in spinning up 2 more brokers... leading to the below.

Simple, this spins up 3 brokers and 3 controllers.

Where possible I've removed dumplication of specifying settings by using a single environment blog/variable (see `x-common-env`) defined at the top thats pulled into each brokers `environment` section using (`<<: *common-env`).


## Modules and Versions

- Confluent Kafka Cluster 7.9.1 - KRAFT mode
- 
  
## To run the project.

- `make run` - Execute/Start the cluster.
- `make down` - To tear everything down
- `make logs`
- `make logsf` - continues stream
- `make ps`
- `make watch`
  
Note all data logs are pipped to the `data/broker#/data` and the server log4j to `data/broker#/log4j` directories. Just for the fun of it and being able to see them...

For a nice overview of Confluents logging setup [see](https://docs.confluent.io/platform/current/installation/docker/operations/logging.html) and a general Apache log4j [overview](https://logging.apache.org/log4j/2.x/manual/configuration.html#Loggers)


You can execute `createTopics.sh` to spin up 3 topics via the 3 nodes and then descripe them. I specifically create them with replication set to 1,2 and 3 to show we're got a cluster working and then lastly we can query the 3rd broker for a list of topics to show it's aware of all the topics distribution and where they all are.

Note: If you going to use this 3 broker build, rather do it on a dedicated host where you have multiple hard drives... as you might be stressing a single drive a bit if using replication anything but 2.

See various configuration settings in .env:

## Projects / Components

- [Confluent in](https://docs.confluent.io)

- [Apache Flink](https://flink.apache.org)


## Misc Notes

### Great notes on running multi broker configurations

This build of mine is a modification to my liking of the below 2 links primarily.

- [Tutorial-multi-broker](https://docs.confluent.io/platform/current/get-started/tutorial-multi-broker.html)
  
- [Multi-broker-multi-controller-kafka-kraft](https://clasence.medium.com/multi-broker-multi-controller-kafka-kraft-mode-with-docker-compose-and-confluentinc-fe32fd02e1ab)


### Great quick reference for docker compose

- [A Deep dive into Docker Compose by Alex Merced](https://dev.to/alexmercedcoder/a-deep-dive-into-docker-compose-27h5)


### Consider using secrets for sensitive information

Still to be done, but for anyone interested.

- [How to use sectrets with Docker Compose](https://docs.docker.com/compose/how-tos/use-secrets/)

### Markdown syntax

The various `REAMDE.md` utilises markdown syntax. You can refer to `https://markdownlivepreview.com` & `https://dillinger.io` for more information, examples.

To view a mardown file, `https://jumpshare.com/viewer/md` or if you using Visual Studio Code search for markdown as a module and try some of them.


### By:

George

[georgelza@gmail.com](georgelza@gmail.com)

[George on Linkedin](https://www.linkedin.com/in/george-leonard-945b502/)

[George on Medium](https://medium.com/@georgelza)

