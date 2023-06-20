from django.db import models
from django.conf import settings 
from django.core.exceptions import ValidationError
from django.utils import timezone

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

    criado_em = models.DateTimeField(default=timezone.now)
    tipo_movimentacao = models.CharField(max_length=15)#Entrada ou Saída
    aluno = models.ForeignKey(Aluno, on_delete=models.CASCADE)

    def __str__(self) -> str:
        return f'{self.aluno.nome}, {self.tipo_movimentacao}'

    def save(self, *args, **kwargs) -> None:
        
        if self.tipo_movimentacao == "Saída":
            entradas = AlunoHistorico.objects.filter(
                aluno__id=self.aluno.id, criado_em__date=self.criado_em.date(), tipo_movimentacao="Entrada"
            )
            saidas = AlunoHistorico.objects.filter(
                aluno__id=self.aluno.id, criado_em__date=self.criado_em.date(), tipo_movimentacao=self.tipo_movimentacao
            )

            if entradas.count() == saidas.count() or (entradas.count() + saidas.count()) == 0:
                raise ValidationError({"Error":"Não é possível sair sem ter entrado anteriormente."})
        
        if self.tipo_movimentacao == "Entrada":
            entradas = AlunoHistorico.objects.filter(
                aluno__id=self.aluno.id, criado_em__date=self.criado_em.date(), tipo_movimentacao=self.tipo_movimentacao
            )
            saidas = AlunoHistorico.objects.filter(
                aluno__id=self.aluno.id, criado_em__date=self.criado_em.date(), tipo_movimentacao="Saída"
            )
            
            if entradas.count() < saidas.count() or entradas.count() > saidas.count():
                raise ValidationError({"Error":"Há uma movimentação de saída pendente."})
            
        return super().save()
    