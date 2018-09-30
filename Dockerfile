FROM python:2.7.15

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install uwsgi

CMD [ "uwsgi -s /tmp/trade_service.sock --manage-script-name --mount /=app:app"]