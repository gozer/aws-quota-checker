FROM python:3.11-alpine@sha256:09d17d5e4c16d0a7a1eea690bcb7c6ab8616b211f8421e429e97c1bef5bd0ed2
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
