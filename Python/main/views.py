from django.shortcuts import render
from django.http import HttpResponse
from django.shortcuts import redirect
from .models import Main

def main(request):
    if request.session.get('main'):
        return redirect('/home2/')
    status = request.GET.get('status')
    return render(request, 'main.html', {'status': status})
