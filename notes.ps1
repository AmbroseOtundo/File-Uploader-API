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