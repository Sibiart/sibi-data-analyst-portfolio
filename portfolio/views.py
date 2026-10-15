from django import forms
from django.contrib import messages
from django.shortcuts import get_object_or_404, redirect, render

from .models import Experience, Message, Project, Skill


class ContactForm(forms.ModelForm):
    class Meta:
        model = Message
        fields = ['name', 'email', 'body']
        labels = {'body': 'Message'}


def home(request):
    form = ContactForm(request.POST or None)
    if request.method == 'POST' and form.is_valid():
        form.save()
        messages.success(request, "Your letter has been received. Thank you.")
        return redirect('/#contact')

    skills = {}
    for s in Skill.objects.all():
        skills.setdefault(s.category, []).append(s)

    return render(request, 'portfolio/home.html', {
        'projects': Project.objects.all(),
        'skills': skills,
        'education': Experience.objects.filter(kind=Experience.EDUCATION),
        'work': Experience.objects.filter(kind=Experience.WORK),
        'courses': Experience.objects.filter(kind=Experience.CERT),
        'form': form,
    })


def project_detail(request, pk):
    return render(request, 'portfolio/project.html',
                  {'project': get_object_or_404(Project, pk=pk)})
