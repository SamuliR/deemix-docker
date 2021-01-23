FROM alpine:3.13

ENV DEEMIX_TAG=c361546f

RUN apk add --no-cache \
	build-base git python3 python3-dev py3-pip

WORKDIR /app
COPY app .

RUN git clone --depth 1 --recursive https://git.rip/RemixDev/deemix-pyweb.git

WORKDIR /app/deemix-pyweb
RUN git checkout $DEEMIX_TAG
RUN pip3 install -U -r server-requirements.txt --disable-pip-version-check

ENTRYPOINT ["/app/entrypoint.sh"]
