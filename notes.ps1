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