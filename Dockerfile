FROM python:3.10-alpine

WORKDIR /app 

COPY requirements.txt /app

RUN pip install --upgrade setuptools pip

RUN pip install Pillow

RUN pip install -r requirements.txt --no-cache-dir

COPY . /app/ 

EXPOSE 8000

CMD ["sh", "-c", "python manage.py makemigrations && python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]