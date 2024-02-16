FROM python:3.7-alpine

# Get latest root certificates
RUN apk add --no-cache ca-certificates && update-ca-certificates

ENV PYTHONUNBUFFERED=1 PYTHONHASHSEED=random PYTHONDONTWRITEBYTECODE=1

EXPOSE 5555

ENV FLOWER_DATA_DIR /data
ENV PYTHONPATH ${FLOWER_DATA_DIR}

WORKDIR $FLOWER_DATA_DIR

VOLUME $FLOWER_DATA_DIR
ADD . $FLOWER_DATA_DIR

RUN pip install . && pip install importlib-metadata==4.13.0 redis==3.5.3

ENTRYPOINT ["flower"]
