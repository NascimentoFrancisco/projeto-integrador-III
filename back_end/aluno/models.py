from django.db import models
from django.conf import settings 

from curso.models import Curso
from responsavel.models import Responsavel
# Create your models here.

class Aluno(models.Model):
    
    nome = models.CharField("Nome", max_length=255, null=False, blank=False)
    data_nascimento = models.DateField("Data de nascimento")
    curso = models.ForeignKey(
        Curso, on_delete=models.PROTECT,
        verbose_name="Curso"
    )
    responsavel = models.ForeignKey(
        Responsavel, on_delete=models.CASCADE,
        verbose_name="Responsável"
    )
    user = models.OneToOneField(
        settings.AUTH_USER_MODEL,
        on_delete=models.CASCADE, 
        verbose_name='Usuário'
    )

    def __str__(self):
        return self.nome


class AlunoHistorico(models.Model):

    criado_em = models.DateTimeField(auto_now_add=True)
    tipo_movimentacao = models.CharField(max_length=15)#Entrada ou saída
    aluno = models.ForeignKey(Aluno, on_delete=models.CASCADE)

    def __str__(self) -> str:
        return self.aluno.nome

    