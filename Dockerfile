FROM python:3.9-alpine

RUN pip install flask redis && \
    addgroup -S flask && adduser -S flask -G flask && \
    mkdir /src && \
    chown -R flask:flask /src

USER flask

COPY app.py /src/app.py

WORKDIR /src

ENV FLASK=app.py

EXPOSE 5000

CMD ["flask", "run", "-h", "0.0.0.0"]
