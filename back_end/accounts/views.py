from rest_framework import generics, viewsets
from rest_framework.permissions import IsAuthenticated

from aluno.models import Aluno


from .serializer_accounts import AlunoSerializer, AlunoListSerializer
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
    
    queryset = Aluno.objects.all()
    serializer_class = AlunoListSerializer

    def get_queryset(self):
        user = self.request.user
        return Aluno.objects.filter(user=user)
