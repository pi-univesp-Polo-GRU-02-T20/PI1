from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static
from fornecedor.views import home, form, create, view, edit, update,delete, home1

urlpatterns = [
    path('admin/', admin.site.urls),  
    #path('', home name='home'),
    path('', include('usuarios.urls')),
    path('main', include('main.urls')), 
    path('home1/', home1), 
    path('home/', home),   
    path('inicial', home, name='home'),
    path('form/', form),
    path('create/', create, name='create'),
    path('view/<int:pk>/', view, name='view'),   
    path('edit/<int:pk>/', edit, name='edit'),
    path('update/<int:pk>/', update, name='update'),
    path('delete/<int:pk>/', delete, name='delete')
    
]

urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)