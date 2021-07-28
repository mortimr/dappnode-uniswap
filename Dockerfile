FROM alpine

RUN apk add --no-cache git nodejs npm yarn python3 \
&&  git clone https://github.com/Uniswap/uniswap-interface /usr/src/app \
&&  cd /usr/src/app \
&&  yarn \
&&  yarn build

WORKDIR /usr/src/app

EXPOSE 8080

ENTRYPOINT python3 -m http.server 8080 --directory ./build
