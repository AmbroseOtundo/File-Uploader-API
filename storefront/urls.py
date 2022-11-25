from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from django.urls import path, include
import debug_toolbar
from drf_yasg import openapi 
from drf_yasg.views import get_schema_view as swagger_get_schema_view 

admin.site.site_header = 'Storefront Admin'
admin.site.index_title = 'Admin'

schema_view = swagger_get_schema_view( 
    openapi. Info( 
        title="Posts API", 
        default_version='1.0.0', 
        description="API documentation of App", 
    ), 
    public=True, ) 

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/v1/',
            include([
    path('swagger/schema/', schema_view.with_ui('swagger', cache_timeout=0), name="swagger-schema"),
    path('', include('core.urls')),
    path('playground/', include('playground.urls')),
    path('store/', include('store.urls')),
    # path('auth/', include('djoser.urls')),
    # path('auth/', include('djoser.urls.jwt')),
    path('__debug__/', include(debug_toolbar.urls)),
    ])
    ),
] 

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
    # urlpatterns += [path('silk/', include('silk.urls', namespace='silk'))]
