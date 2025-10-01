FROM python:3.10-slim
WORKDIR /src
COPY . /src
CMD ["python3","run_proofs.py"]
