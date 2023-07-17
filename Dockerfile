# # Dockerfile

# FROM python:3.9

# ENV PYTHONUNBUFFERED=1

# WORKDIR /app

# COPY requirements.txt /app/

# RUN pip install --no-cache-dir -r requirements.txt

# COPY . /app/

# Collect static files
# RUN python manage.py collectstatic --noinput

# CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

FROM python:3.9

ENV PYTHONUNBUFFERED 1

WORKDIR /app

ADD . /app

COPY ./requirements.txt /app/requirements.txt

RUN pip install -r requirements.txt

COPY . /app

EXPOSE 8000
# RUN python manage.py makemigrations
# RUN python manage.py migrate

CMD exec gunicorn fbclone.wsgi:application --bind 0.0.0.0:8000 --workers 3 

