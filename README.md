# WaterFurnace Aurora MQTT Bridge (ARM64)

Automated native `linux/arm64` Docker builds for the [waterfurnace_aurora](https://github.com/ccutrer/waterfurnace_aurora) Ruby gem. 

The upstream project provides excellent support for interacting with WaterFurnace and GeoSmart geothermal units via an FTDI serial adapter, but currently only publishes `amd64` Docker images. This repository solves that by tracking the upstream GitHub releases and automatically building and publishing an `arm64` container to the GitHub Container Registry (GHCR) whenever a new version is tagged.

## Usage

You can deploy this via Docker Compose or Portainer. Be sure to update the `devices` mapping to match your specific serial adapter and adjust the `MQTT` connection string for your broker.

```yaml
version: '3.8'

services:
  waterfurnace_aurora:
    container_name: waterfurnace_aurora
    image: ghcr.io/bennydiamond/waterfurnace_aurora:latest
    restart: unless-stopped
    devices:
      # Use /dev/serial/by-id/ to prevent path changes across reboots
      - '/dev/serial/by-id/usb-FTDI_Chipi-X_FT2HOLHM-if00-port0:/dev/waterfurnace'
    environment:
      - TTY=/dev/waterfurnace
      - MQTT=mqtt://user:password@broker_ip:1883


## Credits
All credit for the reverse-engineering and Ruby gem development goes to ccutrer/waterfurnace_aurora. This repository only exists to automate the ARM64 Docker build pipeline.
