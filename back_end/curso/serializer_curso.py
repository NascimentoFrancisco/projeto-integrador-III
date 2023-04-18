from rest_framework import serializers

from .models import Curso

class CursoSerializer(serializers.ModelSerializer):

    id = serializers.IntegerField(read_only=True)
    
    class Meta:
        model = Curso
        fields = ["id", "titulo", "sigla", "turno"]