# docker-stellar-core-state

A state container that bundles postgres along with a shared volume. This allows
all stellar-core state to reside on a single container such that the main
stellar-core container can be swapped out without a full state reload.

## Usage

Typically you'll want to run this container with the same env file as the stellar-core container so the command will look something like this:

```console
$ docker run --name scc-node1-state \
    -p 5541:5432                    \
    --env-file single.env           \
    -d stellar/stellar-core-state
```
