from django.db import models
from django.conf import settings 

from curso.models import Curso
# Create your models here.

class Aluno(models.Model):
    
    nome = models.CharField("Nome", max_length=255, null=False, blank=False)
    data_nascimento = models.DateField("Data de nascimento")
    curso = models.ForeignKey(
        Curso, on_delete=models.PROTECT,
        verbose_name="Curso"
    )
    user = models.OneToOneField(
        settings.AUTH_USER_MODEL,
        on_delete=models.CASCADE, 
        verbose_name='Usuário'
    )

    def __str__(self):
        return self.nome