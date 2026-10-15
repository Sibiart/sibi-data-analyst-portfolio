from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='home'),
    path('work/<int:pk>/', views.project_detail, name='project'),
]
