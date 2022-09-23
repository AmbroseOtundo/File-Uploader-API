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



