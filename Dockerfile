FROM amazoncorretto:17

WORKDIR /workdir

COPY . .

ENTRYPOINT ./start.sh