FROM python:3.10-slim

WORKDIR /app

COPY . .

RUN pip install --upgrade pip
RUN pip install jaclang
RUN pip install --no-deps byllm


CMD ["jac", "assess.jac"]