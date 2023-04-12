from django.db import models

# Create your models here.

class Curso(models.Model):

    titulo = models.CharField("Título", verbose_name=255)
    sigla = models.CharField("Título", verbose_name=5)

    def __str__(self) -> str:
        return self.sigla
    