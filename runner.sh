#!/bin/bash
docker build --tag 'fed-client' .
docker kill client{1..11}
docker rm client{1..11}
if ! [[ "$(sudo ufw status)" =~ "inactive" ]]; then
	sudo ufw allow 8080/tcp
fi
SEED=$RANDOM
echo Chose $SEED as the seed
docker run -d --name 'client1' --env CLIENT_ID=0 --env TOTAL_CLIENTS=11 --env SEED=$SEED --env PORT=8080 --env CORES=1 --env FREQUENCY=359 --env MEMORY=250 --env PING=100 --env BANDWIDTH=524288 --add-host=host.docker.internal:host-gateway --cpuset-cpus '0' --cpus '0.15' --memory '250M' fed-client
docker run -d --name 'client2' --env CLIENT_ID=1 --env TOTAL_CLIENTS=11 --env SEED=$SEED --env PORT=8080 --env CORES=1 --env FREQUENCY=599 --env MEMORY=150 --env PING=100 --env BANDWIDTH=524288 --add-host=host.docker.internal:host-gateway --cpuset-cpus '1' --cpus '0.25' --memory '150M' fed-client
docker run -d --name 'client3' --env CLIENT_ID=2 --env TOTAL_CLIENTS=11 --env SEED=$SEED --env PORT=8080 --env CORES=1 --env FREQUENCY=479 --env MEMORY=150 --env PING=100 --env BANDWIDTH=524288 --add-host=host.docker.internal:host-gateway --cpuset-cpus '2' --cpus '0.2' --memory '150M' fed-client
docker run -d --name 'client4' --env CLIENT_ID=3 --env TOTAL_CLIENTS=11 --env SEED=$SEED --env PORT=8080 --env CORES=1 --env FREQUENCY=839 --env MEMORY=150 --env PING=100 --env BANDWIDTH=524288 --add-host=host.docker.internal:host-gateway --cpuset-cpus '3' --cpus '0.35' --memory '150M' fed-client
docker run -d --name 'client5' --env CLIENT_ID=4 --env TOTAL_CLIENTS=11 --env SEED=$SEED --env PORT=8080 --env CORES=1 --env FREQUENCY=239 --env MEMORY=150 --env PING=100 --env BANDWIDTH=524288 --add-host=host.docker.internal:host-gateway --cpuset-cpus '4' --cpus '0.1' --memory '150M' fed-client
docker run -d --name 'client6' --env CLIENT_ID=5 --env TOTAL_CLIENTS=11 --env SEED=$SEED --env PORT=8080 --env CORES=1 --env FREQUENCY=1199 --env MEMORY=150 --env PING=100 --env BANDWIDTH=524288 --add-host=host.docker.internal:host-gateway --cpuset-cpus '5' --cpus '0.5' --memory '150M' fed-client
docker run -d --name 'client7' --env CLIENT_ID=6 --env TOTAL_CLIENTS=11 --env SEED=$SEED --env PORT=8080 --env CORES=1 --env FREQUENCY=239 --env MEMORY=150 --env PING=100 --env BANDWIDTH=524288 --add-host=host.docker.internal:host-gateway --cpuset-cpus '6' --cpus '0.1' --memory '150M' fed-client
docker run -d --name 'client8' --env CLIENT_ID=7 --env TOTAL_CLIENTS=11 --env SEED=$SEED --env PORT=8080 --env CORES=1 --env FREQUENCY=239 --env MEMORY=150 --env PING=100 --env BANDWIDTH=524288 --add-host=host.docker.internal:host-gateway --cpuset-cpus '7' --cpus '0.1' --memory '150M' fed-client
docker run -d --name 'client9' --env CLIENT_ID=8 --env TOTAL_CLIENTS=11 --env SEED=$SEED --env PORT=8080 --env CORES=1 --env FREQUENCY=2399 --env MEMORY=200 --env PING=0 --env BANDWIDTH=1048576 --add-host=host.docker.internal:host-gateway --cpuset-cpus '8' --cpus '1.0' --memory '200M' fed-client
docker run -d --name 'client10' --env CLIENT_ID=9 --env TOTAL_CLIENTS=11 --env SEED=$SEED --env PORT=8080 --env CORES=1 --env FREQUENCY=1799 --env MEMORY=500 --env PING=0 --env BANDWIDTH=1048576 --add-host=host.docker.internal:host-gateway --cpuset-cpus '9' --cpus '0.75' --memory '500M' fed-client
docker run -d --name 'client11' --env CLIENT_ID=10 --env TOTAL_CLIENTS=11 --env SEED=$SEED --env PORT=8080 --env CORES=1 --env FREQUENCY=599 --env MEMORY=150 --env PING=50 --env BANDWIDTH=524288 --add-host=host.docker.internal:host-gateway --cpuset-cpus '10' --cpus '0.25' --memory '150M' fed-client
