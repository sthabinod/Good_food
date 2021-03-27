from django.urls import path
from . import views

urlpatterns = [
    path('login',views.login_now,name="login"),
    path('register',views.register_now,name="register"),
]