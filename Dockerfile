FROM python:3-slim

RUN pip install flask redis && \
    groupadd -r flask && useradd -r -g flask flask && \
    mkdir /src && \
    chown -R flask:flask /src

USER flask

COPY app.py /src/app.py

WORKDIR /src

ENV FLASK=app.py

EXPOSE 5000

CMD ["flask", "run", "-h", "0.0.0.0"]