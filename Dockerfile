FROM ubuntu:latest
WORKDIR /app
RUN apt-get update && apt-get install -y python3 python3-pip
COPY devOps .
COPY devOps/devops/requirements.txt .
WORKDIR /app/devops
RUN pip3 install --no-cache-dir -r requirements.txt
COPY devOps/devops/manage.py* .
EXPOSE 8000
ENV DJANGO_SETTINGS_MODULE=devops.settings
ENTRYPOINT ["python3"]
CMD ["manage.py", "runserver", "0.0.0.0:8000"]