FROM python:3.9

RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi
WORKDIR /app
COPY app /app
COPY cmd.sh /
RUN pip install -r requirements.txt
EXPOSE 9090 9191
USER uwsgi
DOCKER_HOST tcp://localhost:5000
CMD ["/cmd.sh"]

