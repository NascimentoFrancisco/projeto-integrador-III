from rest_framework import generics, viewsets
from rest_framework.permissions import IsAuthenticated
from rest_framework import viewsets
from django.core.mail import send_mail
from django.conf import settings
from django.utils.crypto import get_random_string
from rest_framework import status
from rest_framework.generics import GenericAPIView
from rest_framework.response import Response

from aluno.models import Aluno

from .models import CustomUser
from .serializer_accounts import (
    AlunoSerializer, AlunoListSerializer, ChangePasswordSerializer,
    PasswordResetSerializer
)
# Create your views here.


class AlunoCreateView(generics.CreateAPIView):
    queryset = Aluno.objects.all()
    serializer_class = AlunoSerializer


class AlunoListView(generics.ListAPIView):

    queryset = Aluno.objects.all()
    serializer_class = AlunoListSerializer


class AlunoGetView(viewsets.ModelViewSet):

    permission_classes = [IsAuthenticated]
    
    queryset = Aluno.objects.all()
    serializer_class = AlunoListSerializer


class AlunoGetViewLog(generics.ListAPIView):

    permission_classes = [IsAuthenticated]
    serializer_class = AlunoListSerializer

    def get_queryset(self):
        user = self.request.user
        return Aluno.objects.filter(user=user)


class ChangePasswordView(generics.UpdateAPIView):

    queryset = CustomUser.objects.all()
    permission_classes = [IsAuthenticated]
    serializer_class = ChangePasswordSerializer


class PasswordResetView(GenericAPIView):

    serializer_class = PasswordResetSerializer

    def post(self, request, *args, **kwargs):

        serailizer = self.get_serializer(data=request.data)
        serailizer.is_valid(raise_exception=True)
        email = serailizer.validated_data['email']

        try:
            user = CustomUser.objects.get(email=email)
        except CustomUser.DoesNotExist:
            return Response(
                {"detail":"O usuário com o e-mail fornecido não existe."},
                status=status.HTTP_400_BAD_REQUEST
            )
        
        new_password = get_random_string(length=8)
        
        msg = f"""
        Olá {user.aluno.nome}, você solicitou uma redefinição de senha, aabaixo está sua nova senha.\n
        Nova senha: {new_password}\n
        Nunca compartilhe sua senha para assim preservar pela segurança de seus dados.
        """

        send_mail(
            "Sua nova senha",
            msg,
            settings.EMAIL_HOST_USER,
            [user.email],
            fail_silently=False,
        )

        user.set_password(new_password)
        user.save() 

        return Response(
            {"detail":"Sua senha redefenida, sua nova senha foi enviada no seu email."},
            status=status.HTTP_200_OK
        )
