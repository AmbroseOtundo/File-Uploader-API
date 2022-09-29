import os
from celery import Celery


os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'storefront.settings.dev')

# Setting up the celery app.
celery = Celery('storefront')
 # namespace Telling celery to look for the `CELERY` namespace in the settings file.
celery.config_from_object('django.conf:settings',namespace='CELERY')
celery.autodiscover_tasks()