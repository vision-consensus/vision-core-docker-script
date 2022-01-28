# vision-core-docker-script

This docker image provides a simple way to run vision-core for development and testing.

This image provides a vpioneer chain and standalone.

## Ports

| Port  | Service      | Description          |
|-------|--------------|----------------------|
| 6666  | eventserver  | event query port     |
| 7080  | fullnode     | fullnode port        |
| 7081  | solidity     | solidity port        |
| 7082  | PBFT         | PBFT port            |
| 16666 | vision-core  | peer node port       |
| 60061 | fullnode rpc | fullnode rpc port    |
| 60071 | solidity rpc | solidity rpc port    |
| 60081 | PBFT rpc     | PBFT rpc port        |

## Usage
### standalone network
###### In standalone network mode, the node will run alone.

Actor: Witness
```
$ docker run -itd \
    -v "/str:/data/vision" \
    -p 6666:6666 \
    -p 7080:7080 \
    -p 7081:7081 \
    -p 7082:7082 \
    -p 16666:16666 \
    -p 60061:60061 \
    -p 60071:60071 \
    -p 60081:60081 \
    --name vision-standalone \
    maintainers/vision:ultima_v1.0.2 --net standalone
```
### vpioneer network
###### In vpioneer network mode, the node will join the vpioneer network.

Actor: Fullnode
```
$ docker run -itd \
    -v "/str:/data/vision" \
    -p 6666:6666 \
    -p 7080:7080 \
    -p 7081:7081 \
    -p 7082:7082 \
    -p 16666:16666 \
    -p 60061:60061 \
    -p 60071:60071 \
    -p 60081:60081 \
    --name vision-vpioneer \
    maintainers/vision:ultima_v1.0.2 --net vpioneer
```

Actor: Witness
```
$ docker run -itd \
    -v "/str:/data/vision" \
    -p 6666:6666 \
    -p 7080:7080 \
    -p 7081:7081 \
    -p 7082:7082 \
    -p 16666:16666 \
    -p 60061:60061 \
    -p 60071:60071 \
    -p 60081:60081 \
    --name vision-vpioneer \
    maintainers/vision:ultima_v1.0.2 --net vpioneer --private <private-key>
```

### build locally
```docker build --build-arg VISION_VERSION={BRANCH}_{VERSION} -t vision:test .```
