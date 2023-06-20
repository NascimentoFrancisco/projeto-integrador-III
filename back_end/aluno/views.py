from rest_framework import generics
from rest_framework.permissions import IsAuthenticated

from .serializer_aluno import SerializerCreateHistorico 
from .models import AlunoHistorico


class CreateHistoricoAluno(generics.CreateAPIView):

    queryset = AlunoHistorico.objects.all()    
    serializer_class = SerializerCreateHistorico
    #permission_classes = [IsAuthenticated]
