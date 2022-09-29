release: python manage.py migrate
web: python gunicorn storefront.wsgi
worker: celery -A storefront worker