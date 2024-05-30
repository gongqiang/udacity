FROM python:3.10

RUN apt update -y && \
    apt install -y build-essential libpq-dev && \
    pip3 install --upgrade pip setuptools wheel

WORKDIR /usr/src/app

COPY analytics ./

RUN pip3 install -r requirements.txt

ENV DB_USERNAME=myuser
ENV DB_PASSWORD=mypassword
ENV DB_HOST=127.0.0.1
# ENV DB_HOST=host.docker.internal
ENV DB_PORT=5432
ENV DB_NAME=mydatabase

EXPOSE 5153

CMD ["python", "app.py"]
