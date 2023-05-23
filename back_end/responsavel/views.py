from django.shortcuts import render
from rest_framework import generics
from rest_framework.permissions import IsAuthenticated

from .models import Responsavel
from .responsavel_serializer import ResposanvelSerializer, ResponsavelListSerializer
# Create your views here.


class ResponsavelCreateView(generics.CreateAPIView):
    queryset = Responsavel.objects.all()
    serializer_class = ResposanvelSerializer


class ResponsavelListView(generics.ListAPIView):

    queryset = Responsavel.objects.all()
    serializer_class = ResponsavelListSerializer
    
    
class ResponsavelGetViewLog(generics.ListAPIView):

    permission_classes = [IsAuthenticated]
    serializer_class = ResposanvelSerializer

    def get_queryset(self):
        user = self.request.user
        return Responsavel.objects.filter(user=user)