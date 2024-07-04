FROM ubuntu
WORKDIR /app
RUN apt-get update && apt-get install -y python3 python3-pip
COPY python-web-app/requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt
COPY python-web-app .
EXPOSE 3000
ENTRYPOINT ["python3"]
CMD ["manage.py", "runserver", "0.0.0.0:8000"]