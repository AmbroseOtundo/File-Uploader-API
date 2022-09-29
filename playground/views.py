from django.shortcuts import render
from django.utils.decorators import method_decorator
from rest_framework.views import APIView
from django.views.decorators.cache import cache_page
import requests
import logging
from . import views

@cache_page(5 * 60)
def say_hello(request):
    response = requests.get('http://httpbin.org/delay/2')
    data = response.json()
    return render(request, 'hello.html', {'name': data })

# Using a class based caching view
class HelloView(APIView):
    @method_decorator(cache_page(5 * 60))
    def get(self, request):
        response = requests.get('https://httpbin.org/delay/2')
        data = response.json()
        return render(request, 'hello.html', {'name': 'Mosh'})


# class HelloView(APIView):
#     def get(self, request):
#         try:
#             logger.info('Calling httpbin')
#             response = requests.get('https://httpbin.org/delay/2')
#             logger.info('Recieved the response')
#             data = response.json()
#         except requests.ConnectionError:
#             logger.critical('httpbin is offline')
#         return render(request, 'hello.html', {'name': 'Mosh'})


# Logging
logger = logging.getLogger(__name__) #playground.views
def say_hello(request):
    try:
        logger.info('Calling httpbin')
        response = requests.get('https://httpbin.org/delay/2')
        logger.info('Recieved the response')
        data = response.json()
    except requests.ConnectionError:
            logger.critical('httpbin is offline')
    return render(request, 'hello.html', {'name': 'Mosh'})