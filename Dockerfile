FROM python:3-alpine
EXPOSE 5000
WORKDIR /usr/src/app

RUN apk add uwsgi uwsgi-http uwsgi-python3

RUN pip install virtualenv
RUN python -m virtualenv --python=/usr/local/bin/python ./venv

COPY requirements.txt ./
RUN source ./venv/bin/activate && pip --no-cache-dir install -r requirements.txt

COPY server.py ./

COPY start.sh ./
RUN chmod +x start.sh

CMD ./start.sh
