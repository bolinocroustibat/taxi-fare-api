FROM python:3.8.10-slim as builder

COPY ./model.joblib /
COPY ./requirements.txt /
COPY ./api /api
COPY ./TaxiFareModel /TaxiFareModel

RUN python -m venv /venv \
    && pip install --upgrade pip \
    && pip --no-cache-dir install -r requirements.txt

# Internal port as env variable (and its default value of not provided)
ENV PORT 80
# Internal host as env variable (and its default value of not provided)
ENV HOST 0.0.0.0

# Bash command
CMD uvicorn api.fast:app --host $HOST --port $PORT
# Other syntax (recommended by Docker):
# CMD ["uvicorn", "api.fast:app", "--host", "$HOST", "--port", "$PORT"]
