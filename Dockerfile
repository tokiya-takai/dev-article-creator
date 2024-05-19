FROM python:3.9-slim

MAINTAINER tokiya-takai

WORKDIR /app

COPY requirements.txt .
COPY .streamlit/ /root/.streamlit/

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install default-mysql-client && \
    pip install -r requirements.txt

EXPOSE 8501

COPY . /app

ENTRYPOINT ["streamlit", "run"]

CMD ["main.py"]
