FROM python:3.6.6-alpine
COPY sa /app
WORKDIR /app
#RUN apk update && apk add libressl-dev postgresql-dev libffi-dev gcc musl-dev python3-dev 
#RUN apk update && apk add libressl-dev postgresql-dev libffi-dev gcc musl-dev
# This is for fixing the missing gcc library in alpine image. On mac it is present as part of x-code.
# Try removing libressl-dev and/or libffi-dev
RUN apk update && apk add libressl-dev libffi-dev gcc musl-dev
RUN pip3 install -r requirements.txt
# Without this you will get NLTK not found in docker logs.
RUN python3 -m nltk.downloader punkt
EXPOSE 5000
ENTRYPOINT ["python3"]
CMD ["sentiment_analysis.py"]