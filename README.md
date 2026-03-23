# WaterFurnace Aurora MQTT Bridge (ARM64)

Automated native `linux/arm64` Docker builds for the [waterfurnace_aurora](https://github.com/ccutrer/waterfurnace_aurora) Ruby gem. 

The upstream project provides excellent support for interacting with WaterFurnace and GeoSmart geothermal units via an FTDI serial adapter, but currently only publishes `amd64` Docker images. This repository solves that by tracking the upstream GitHub releases and automatically building and publishing an `arm64` container to the GitHub Container Registry (GHCR) whenever a new version is tagged.

## Deployment

This repository is designed to be deployed directly via **Portainer Stacks** or **Docker Compose** using environment variables to keep the configuration portable and hardware-agnostic.

### Deploy via Portainer (Recommended)

1. Go to **Stacks** -> **Add stack**.
2. Select **Repository** as the build method.
3. Enter the Repository URL: `https://github.com/bennydiamond/waterfurnace_aurora_arm64`
4. Under **Environment variables**, add the following keys:

| Variable | Example Value | Description |
| :--- | :--- | :--- |
| `SERIAL_DEVICE` | `/dev/serial/by-id/usb-FTDI_FT2HOLHM-if00-port0` | Path to your FTDI adapter on the host. |
| `MQTT_URL` | `mqtt://user:pass@mosquitto:1883` | Your MQTT broker connection string. |
| `EXTERNAL_NETWORK` | `mqtt-network` | The name of the existing Docker network to join. |

5. Click **Deploy the stack**.

### Manual Docker Compose

If running manually, create a `.env` file in the same directory as your `docker-compose.yml`:

```env
SERIAL_DEVICE=/dev/serial/by-id/usb-FTDI_Chipi-X_FT2HOLHM-if00-port0
MQTT_URL=mqtt://aurora:aurora@mosquitto:1883
EXTERNAL_NETWORK=mqtt-network
```

Then run:

```bash
docker-compose up -d
```


## Credits
All credit for the reverse-engineering and Ruby gem development goes to ccutrer/waterfurnace_aurora. This repository only exists to automate the ARM64 Docker build pipeline.
