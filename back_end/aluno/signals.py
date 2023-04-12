from django.db.models.signals import pre_save
from django.dispatch import receiver
from django.contrib.auth.models import Permission
from django.contrib.contenttypes.models import ContentType

from accounts.models import User
from .models import Aluno

@receiver(pre_save, sender=Aluno)
def create_user(sender, instance: Aluno, **kwargs):
    if not instance.user:
        user:User = User.objects.create(
            matricula = instance.curso,
        )
        user.set_password(instance.curso)
        user.save()
        instance.user = user

        #Aluno permissions
        content_type = ContentType.objects.get_for_model(Aluno)
        alunos_permissions = Permission.objects.filter(content_type=content_type)

        for perm in alunos_permissions:
            if perm.codename == 'change_aluno' or perm.codename == 'view_aluno':
                user.user_permissions.add(perm)
        
        #User permissions
        content_type = ContentType.objects.get_for_model(User)
        user_permissions = Permission.objects.filter(content_type=content_type)

        for perm in user_permissions:
            if perm.codename == 'change_user' or perm.codename == 'view_user':
                user.user_permissions.add(perm)
