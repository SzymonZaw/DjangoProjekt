# Pobieranie oficjalnego obrazu Python 3.9 jako bazowego
FROM python:3.9.7-slim-buster

# Ustawienie katalogu roboczego
WORKDIR /code

# Kopiowanie wymaganych plików do kontenera
COPY requirements.txt /code/
COPY . /code/

# Instalacja zależności aplikacji
RUN pip install --no-cache-dir -r requirements.txt

# Ustawienie zmiennej środowiskowej dla Django
ENV DJANGO_SETTINGS_MODULE=MGA_ZADANIE.settings

# Uruchomienie serwera Waitress

CMD ["waitress-serve", "--port=8000", "MGA_ZADANIE.wsgi:application"]
