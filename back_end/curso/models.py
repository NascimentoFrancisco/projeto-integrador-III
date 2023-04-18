from django.db import models

# Create your models here.

class Curso(models.Model):

    titulo = models.CharField("Título", max_length=255)
    sigla = models.CharField("Sigla", max_length=5)
    turno = models.CharField("Turno", max_length=20)

    def __str__(self) -> str:
        return self.sigla
    