FROM python:3.13-alpine@sha256:c38ead8bcf521573dad837d7ecfdebbc87792202e89953ba8b2b83a9c5a520b6
LABEL org.opencontainers.image.source https://github.com/brennerm/aws-quota-checker
WORKDIR /app
ADD setup.py /app
ADD README.md /app
ADD LICENSE /app
ADD Dockerfile /app
ADD aws_quota /app/aws_quota
RUN pip install .[prometheus]
RUN adduser --disabled-password aqc
USER aqc
ENTRYPOINT ["aws-quota-checker"]
CMD "--help"
