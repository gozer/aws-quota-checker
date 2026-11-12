FROM python:3.15-alpine@sha256:0f9552bb28711333da16915ec146f5e6bb44a7fdac9ced15dc17c2e0206346dd
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
