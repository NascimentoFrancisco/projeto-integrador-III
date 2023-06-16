from rest_framework import generics, viewsets
from rest_framework.permissions import IsAuthenticated
from rest_framework.views import APIView

from .guarda_serializer import GuardaSerializer, GuardaCreateSerializer
from .models import Guarda
# Create your views here.

class GuardaCreateView(generics.CreateAPIView):
    queryset = Guarda.objects.all()
    serializer_class = GuardaCreateSerializer

class GetGuardaLogView(generics.ListAPIView):

    permission_classes = [IsAuthenticated]
    serializer_class = GuardaSerializer

    def get_queryset(self):
        user = self.request.user
        return Guarda.objects.filter(user=user)




