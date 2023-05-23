from django.db import models
from django.conf import settings 

# Create your models here.
class Responsavel(models.Model):

    nome = models.CharField("Nome", max_length=255, null=False, blank=False)
    data_nascimento = models.DateField("Data de nascimento")
    criado_em = models.DateTimeField(auto_now_add=True)
    user = models.OneToOneField(
        settings.AUTH_USER_MODEL,
        on_delete=models.CASCADE, 
        verbose_name='Usuário'
    )

    def __str__(self):
        return self.nome