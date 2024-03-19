
FROM python:3.12
WORKDIR /action/workspace

COPY . /action/workspace/

RUN python3 -m pip install --no-cache-dir -r requirements.txt

ENTRYPOINT ["sh", "entrypoint.sh"]
