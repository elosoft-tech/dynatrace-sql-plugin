FROM python:3.10.0a1-slim-buster

WORKDIR /usr/src/app

COPY requirements.txt ./
COPY installODBCDrivers.sh ./

ENV LD_LIBRARY_PATH=/opt/oracleodbc/instantclient_19_8:/opt/microsoft/msodbcsql17/lib64
ENV ODBCINI=/etc/odbc.ini
ENV BUILD_PACKAGES="unixodbc-dev python3-dev curl wget python3-pip unzip libffi-dev libodbc1"
RUN bash ./installODBCDrivers.sh \
    && pip3 install -r requirements.txt \
    && apt-get remove --purge -y $BUILD_PACKAGES && apt-get clean autoclean && apt-get autoremove --yes && rm -rf /var/lib/apt/lists/*
COPY src/ .

CMD [ "python", "./server.py" ]