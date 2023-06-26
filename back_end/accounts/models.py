from django.contrib.auth.models import AbstractBaseUser, PermissionsMixin
from django.db import models
from cpf_field.models import CPFField
# Create your models here.

from .managers import CustomUserManager

class CustomUser(AbstractBaseUser, PermissionsMixin):

    cpf = CPFField(
        "CPF", max_length=11, null=True, blank=True, unique=True,
        error_messages={"unique":"Este CPF já está cadastrada no sistema."},
        help_text="CPF sem pontos e traços."
    )

    email = models.EmailField(
        "Email", unique=True, 
        error_messages={"unique":"Este email já está cadastrado no sistema."}
    )
    is_staff = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)
    updated_at = models.DateTimeField(auto_now=True)
    created_at = models.DateTimeField(auto_now_add=True)

    USERNAME_FIELD = "cpf"
    REQUIRED_FIELDS = ["email"]

    objects = CustomUserManager()

    def __str__(self):
        return self.cpf

        