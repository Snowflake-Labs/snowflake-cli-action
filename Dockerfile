
FROM python:3.12
WORKDIR /action/workspace

COPY requirements.txt *.py *.sh /action/workspace/

RUN python3 -m pip install --no-cache-dir -r requirements.txt

#RUN echo "$1" >> config.toml
#RUN chmod 0600 config.toml

#ENTRYPOINT ["py", "entrypoint.py"]

ENTRYPOINT ["sh", "entrypoint.sh"]
