FROM python:3.6-alpine

ENV FLASK_APP zeroarm.py
ENV FLASK_CONFIG production

RUN adduser -D zeroarm
USER zeroarm

WORKDIR /home/zeroarm

COPY requirements requirements
RUN python -m venv venv
RUN venv/bin/pip install -i https://mirrors.ustc.edu.cn/pypi/web/simple -r requirements/docker.txt

COPY app app
COPY migrations migrations
COPY zeroarm.py config.py boot.sh ./

# run-time configuration
EXPOSE 5000
ENTRYPOINT ["./boot.sh"]
