from django.shortcuts import render, redirect
from cliente.forms import clienteForm
from cliente.models import cliente
from django.core.paginator import Paginator


# Create your views here.
def home(request):
    data = {}
    search = request.GET.get('search')
    if search:
        data['db'] = cliente.objects.filter(nme_cliente__icontains=search)
    else:
        data['db'] = cliente.objects.all()
    return render(request, 'index.html', data)

def form(request):
    data = {}
    data['form'] = clienteForm()
    return render(request, 'form.html', data)

def create(request):
    form = clienteForm(request.POST or None)
    if form.is_valid():
        form.save()
        return redirect('home')

def view(request, pk):
    data = {}
    data['db'] = cliente.objects.get(pk=pk)
    return render(request, 'view.html', data)

def edit(request, pk):
    data = {}
    data['db'] = cliente.objects.get(pk=pk)
    data['form'] = clienteForm(instance=data['db'])
    return render(request, 'form.html', data)

def update(request, pk):
    data = {}
    data['db'] = cliente.objects.get(pk=pk)
    form = clienteForm(request.POST or None, instance=data['db'])
    if form.is_valid():
        form.save()
        return redirect('home')
    
def delete(request, pk):
    db = cliente.objects.get(pk=pk)
    db.delete()
    return redirect('home')

#def home(request):
    data = {}
    all = cliente.objects.all()
    paginator = Paginator(all, 2)
    pages = request.GET.get('page')
    data['db'] = paginator.get_page(pages)
    return render(request, 'index.html', data)

