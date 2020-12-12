FROM python:3.8
WORKDIR /app 
COPY requirement.txt .
RUN apt-get update && \
apt-get install -y python3 python3-pip
RUN pip3 install --no-cache-dir -r requirement.txt
RUN python3 -m nltk.downloader punkt
RUN python3 -m nltk.downloader wordnet
COPY . /app
EXPOSE 5000
CMD [ "python", "./app.py" ]