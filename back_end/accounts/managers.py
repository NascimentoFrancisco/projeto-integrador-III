from django.contrib.auth.base_user import BaseUserManager


class CustomUserManager(BaseUserManager):

    def create_user(self, matricula, cpf, email, password, **extra_fields):
        
        if not matricula:
            raise ValueError("O matrícula deve ser definido")

        if not cpf:
            raise ValueError("O CPF deve ser definido")

        email = self.normalize_email(email)
        user = self.model(matricula = matricula, cpf = cpf, email = email, **extra_fields)
        user.set_password(password)
        user.save()
        return user
    
    def create_superuser(self, matricula, cpf, email, password, **extra_fields):
        
        extra_fields.setdefault("is_staff", True)
        extra_fields.setdefault("is_superuser", True)
        extra_fields.setdefault("is_active", True)

        if extra_fields.get("is_staff") is not True:
            raise ValueError("Superusuario deve ter is_staff=True.")
        if extra_fields.get("is_superuser") is not True:
            raise ValueError("Superusuario deve ter is_superuser=True.")
        
        return self.create_user(matricula, cpf, email, password, **extra_fields)