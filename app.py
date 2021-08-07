from flask import Flask
from redis import StrictRedis
import os
import socket


# test

app = Flask(__name__)
redis = StrictRedis(host=os.environ.get('REDIS_HOST', '127.0.0.1'),
                    port=6379, password=os.environ.get('REDIS_PASS', 'redis'))


@app.route('/')
def hello():
    redis.incr('hits')
    return f"Hello Container World! I have been seen {redis.get('hits').decode('utf-8')} times and my hostname is {socket.gethostname()}.\n"
