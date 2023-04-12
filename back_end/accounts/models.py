from django.contrib.auth.models import AbstractBaseUser, PermissionsMixin
from django.db import models
# Create your models here.

from .managers import CustomUserManager

class User(AbstractBaseUser, PermissionsMixin):

    cpf = models.CharField(
        "CPF", max_length=11, null=True, blank=True
    )
    matricula = models.CharField(
        "Matrícula", max_length=20, unique=True,
        error_messages={"unique":"Esta matrícula já está cadastrada no sistema."}
    )
    is_staff = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)
    created_at = models.DateTimeField(auto_now_add=True)

    USERNAME_FIELD = "matricula"
    REQUIRED_FIELDS = []

    objects = CustomUserManager()

    def __str__(self):
        return self.matricula

        