from django.contrib import admin

# Register your models here.
from .models import Aluno, AlunoHistorico

admin.site.register(Aluno)
admin.site.register(AlunoHistorico)