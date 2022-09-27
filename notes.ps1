# Managing media files
 -- create a new folder : media
 -- add it in settings

    MEDIA_URL = '/media/'
    MEDIA_ROOT = os.path.join(BASE_DIR, 'media')

    -- do this in the root proj folder -- storefront:
    from django.conf import settings
    from django.conf.urls.static import static

    urlpatterns[some urls]

    if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

# Adding images to products
 pip install Pillow to allow upload_to of images
    class ProductImage(models.Model):
        product = models.ForeignKey(Product, on_delete=models.CASCADE, related_name='images')
        image = models.ImageField(upload_to='store/images')

# Building an API to upload images
 -- an endpoint -- : /products/1/images/
#  Returning images from the 
# Validating uploaded images
    -- We create a new file of Validating the error of  large file execeding 500 kb. the file is validators.py 
        the store app
    -- check the productimage model for the image validators
# Setting up the client app
-- use npm to start the client app
# Enabling Cors
 --CORS == Cross Origin Resource Sharing -- this is a security feature
 -- https://github.com/adamchainz/django-cors-headers
 -- python -m pip install django-cors-headers
-- setting set up Origin
# Managing Images in the Admin
-- check the commit for the file changes. such a crucial piece of coding

# Sending emails 
    # -- Setting a fake smtp server
    # https://github.com/rnwood/smtp4dev
    # docker run --rm -it -p 3000:80 -p 2525:25 rnwood/smtp4dev -- run this multiple times until it works
    # configuring the Email Backend: -- smtp (default)
                                     -- console Backend:
                                     -- file Backend:
                                     -- Locmem Backend:
                                     -- Dummy Backend:
                                     EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'
                                        : -- we can replace smtp with the above other backends
    # Sending emails
    # Sending templated emails -- pip install django-templated-mail

# Runnig background Resources
# intro to Celery:
In every application we have resource intensive tasks such as:
    -- Processsing Images
    -- Generating Reports
    -- Sending emails
    -- Running machine learning models
-- Celery helps to run tasks and also help us schedule tasks
    # 1. Message brokers
    -- Our application commucates with workers through a queue
     fig 1.1 
        APPLICATION     ----- queue     ---  worker1
                        {MESSAGE BROKER}     worker2
                                            worker3
    -- Message brokers pass messages btn applications in a reliable way
    -- If one broker goes offline we can set up other brokers to continue working
            -- The two famous broker are:
                -- Redis (In memory data store)
                -- RabbitMQ (A real enterprise-grade broker)
    -- installing Redis
    -- docker run -d -p 6379:6379 redis -- run this in a powershell or any terminal
    -- check if container is running  --- docker ps
    -- pip install redis
    -- celery has been deprecated in running in windows, so fire up WSL for ubuntu
    -- pip install celery 
    -- check git log for changed files
    -- celery -A storefront worker --loglevel=info :-- starts Celery
    -- A specifies our  project name. and log level for debugging

# Scheduling Periodic Tasks
--  We use Celery beat as a task schedular.
-- more configuration check celery beat docs
-- run after configuration -- celery -A storefront beat

# Monitoring celery tasks with flower
-- install it :
-- pip install flower
-- starting it -- : celery -A storefront flower
-- acces it at http://localhost:5555/

# Automated Testing
-- Note --  Test behaviours and not implementations
-- 
# Testing Frameworks
-- unittest
-- pytest

-- we use pytest because it has less boilerplate and tons of support
-- pip install -U pytest
-- pip install -U pytest == for django

# Writing our first test
-- The convention for writing is use of underscores
e.g -- test_collections
-- the test should be clear on what it is Testing

# Running our tests
-- creat a config file
-- in root folder create pytest.ini
-- run pytest in the cli
-- we can target specific modules , class, folder etc
-- pytest store/tests/test_collectionspy::testcreatecollection
-- run tests with anonymouse attribute we can use -- pytest k

# Skipping Tests
we run a decorator @pytest.mark.skip on a specific method