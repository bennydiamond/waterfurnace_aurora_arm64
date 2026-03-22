FROM ruby:3.4.9
ARG WATERFURNACE_AURORA_VERSION
ENV TTY=/dev/waterfurnace
ENV MQTT=mqtt://localhost
RUN gem install waterfurnace_aurora -v ${WATERFURNACE_AURORA_VERSION}
WORKDIR /usr/local/bundle/bin/
CMD ruby aurora_mqtt_bridge $TTY $MQTT

