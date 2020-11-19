from django.db import models


# todo list with time table
class List(models.Model):
    task = models.CharField(max_length=200)
    time = models.TimeField(auto_now=False, auto_now_add=False, auto_created=False)
    is_done = models.BooleanField(null=False,blank=True)
