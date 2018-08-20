FROM python:3.7

RUN pip install -U pip

ENV workdir /app

WORKDIR ${workdir}
ADD requirements.txt ${workdir}
ADD requirements-dev.txt ${workdir}

RUN echo "alias l='ls -lahF --color=auto'" >> /root/.bashrc

RUN pip install -r requirements-dev.txt
