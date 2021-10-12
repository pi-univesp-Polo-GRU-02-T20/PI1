from django.shortcuts import render, redirect
from fornecedor.forms import fornecedorForm
from fornecedor.models import fornecedor
from django.core.paginator import Paginator


# Create your views here.
def home(request):
    data = {}
    search = request.GET.get('search')
    if search:
        data['db'] = fornecedor.objects.filter(nme_cliente__icontains=search)
    else:
        data['db'] = fornecedor.objects.all()
    return render(request, 'index.html', data)

def home1(request):
    data = {}
    search = request.GET.get('search')
    if search:
        data['db'] = fornecedor.objects.filter(nme_cliente__icontains=search)
    else:
        data['db'] = fornecedor.objects.all()
    return render(request, 'index1.html', data)

def form(request):
    data = {}
    data['form'] = fornecedorForm()
    return render(request, 'form.html', data)

def create(request):
    form = fornecedorForm(request.POST or None)
    if form.is_valid():
        form.save()
        return redirect('home')

def view(request, pk):
    data = {}
    data['db'] = fornecedor.objects.get(pk=pk)
    return render(request, 'view.html', data)

def edit(request, pk):
    data = {}
    data['db'] = fornecedor.objects.get(pk=pk)
    data['form'] = fornecedorForm(instance=data['db'])
    return render(request, 'form.html', data)

def update(request, pk):
    data = {}
    data['db'] = fornecedor.objects.get(pk=pk)
    form = fornecedorForm(request.POST or None, instance=data['db'])
    if form.is_valid():
        form.save()
        return redirect('home')
    
def delete(request, pk):
    db = fornecedor.objects.get(pk=pk)
    db.delete()
    return redirect('home')

#def home(request):
    data = {}
    all = fornecedor.objects.all()
    paginator = Paginator(all, 2)
    pages = request.GET.get('page')
    data['db'] = paginator.get_page(pages)
    return render(request, 'index.html', data)

# Create your views here.
