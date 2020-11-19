from django.shortcuts import render, get_object_or_404, redirect
from .models import List


def index(request):

    tasks = List.objects.all()
    context = {'tasks':tasks}
    return render(request,"index.html",context)

def create(request):
    if request.method == 'POST':
        task = request.POST.get('task')
        time = request.POST.get('time')
        is_done = False
        task_info = List(task=task,time=time,is_done=is_done)
        task_info.save()
    return render(request,"crud/create.html")

def delete(request,id):
    task_num = get_object_or_404(List, id=id)
    task_num.delete()
    return redirect('index')


def edit(request,id):
    task_num = get_object_or_404(List, id=id)
    context = {'task_obj':task_num}
    if request.method =='POST':
        return redirect(request,'index')
    return render(request,'crud/create-edit.html',context)