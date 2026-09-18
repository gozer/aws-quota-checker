FROM python:3.11-alpine@sha256:0495f5559318affa673172ec7e35cd0a5213e4aaf4c76d0a66554c0af97b157e
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
