apt update
apt install -y unixodbc unixodbc-dev python-dev libgssapi-krb5-2 odbc-postgresql curl wget python3-pip libaio1 libffi-dev unzip libodbc1

echo "======= MYSQL ========"
#MySQL
wget https://downloads.mysql.com/archives/get/p/10/file/mysql-connector-odbc_8.0.21-1ubuntu20.04_amd64.deb
dpkg -i mysql-connector-odbc_8.0.21-1ubuntu20.04_amd64.deb
rm mysql-connector-odbc_8.0.21-1ubuntu20.04_amd64.deb

#MSSQL
echo "======= MSSQL ========"
curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
curl https://packages.microsoft.com/config/debian/10/prod.list > /etc/apt/sources.list.d/mssql-release.list

apt update
ACCEPT_EULA=Y apt install msodbcsql17
apt install libgssapi-krb5-2

echo "======= ORACLE ========"
#Oracle
wget https://download.oracle.com/otn_software/linux/instantclient/19800/instantclient-basiclite-linux.x64-19.8.0.0.0dbru.zip
wget https://download.oracle.com/otn_software/linux/instantclient/19800/instantclient-odbc-linux.x64-19.8.0.0.0dbru.zip
rm -rf /opt/oracleodbc 
mkdir /opt/oracleodbc
unzip instantclient-basiclite-linux.x64-19.8.0.0.0dbru.zip -d /opt/oracleodbc
unzip instantclient-odbc-linux.x64-19.8.0.0.0dbru.zip -d /opt/oracleodbc
rm instantclient*
cd /opt/oracleodbc/instantclient_19_8
/bin/bash ./odbc_update_ini.sh /

#PostgreSQL installed with first apt install
