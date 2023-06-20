import pytz
from datetime import datetime
from django.utils import timezone
from rest_framework import generics, viewsets
from rest_framework.permissions import IsAuthenticated
from rest_framework import viewsets
from django.core.mail import send_mail
from django.conf import settings
from django.utils.crypto import get_random_string
from rest_framework import status
from rest_framework.generics import GenericAPIView
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework import status
from aluno.models import Aluno, AlunoHistorico
from rest_framework_simplejwt.tokens import AccessToken
from .models import CustomUser
from .serializer_accounts import (
    AlunoSerializer, AlunoListSerializer, ChangePasswordSerializer,
    PasswordResetSerializer, HistoricoSerializaer
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


class GetAulonsPeloIdResponsavel(generics.ListAPIView):
    
    permission_classes = [IsAuthenticated]
    serializer_class = AlunoListSerializer

    def get_queryset(self):
        return Aluno.objects.filter(responsavel__id=self.kwargs["id"])


class GetHistoricoAlunos(APIView):

    permission_classes = [IsAuthenticated]

    def get(self, request):
        
        # URL para ser usada assim
        # http://127.0.0.1:8000/historico/?id=1&data_inicio=2023-06-10&data_final=2023-06-15
        
        id = request.GET.get("id")
        data_inicio = request.GET.get("data_inicio")
        data_final = request.GET.get("data_final")

        if not data_inicio:
            data_inicio = timezone.now() - timezone.timedelta(days=7)
        
        queryset = AlunoHistorico.objects.filter(aluno=id, criado_em__gte=data_inicio)

        if data_final:
            queryset = queryset.filter(criado_em__lte=data_final)
        
        serializer = HistoricoSerializaer(queryset, many=True)
        return Response(serializer.data)
    

