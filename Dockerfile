FROM postgres:latest

ENV POSTGRES_DB=hospital_db
ENV POSTGRES_USER=hospital
ENV POSTGRES_PASSWORD=senha123

COPY init.sql /docker-entrypoint-initdb.d/