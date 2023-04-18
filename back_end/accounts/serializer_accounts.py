from rest_framework import serializers

from curso.serializer_curso import CursoSerializer

from aluno.models import Aluno
from .models import CustomUser

class UserSelializerRead(serializers.ModelSerializer):

    id = serializers.IntegerField(read_only=True)
    
    class Meta:
        model = CustomUser
        fields = ["id", "cpf", "matricula", "email"]


class UserSerializer(serializers.ModelSerializer):
     
    id = serializers.IntegerField(read_only=True)
    password = serializers.CharField(write_only=True)
    
    class Meta:
        model = CustomUser
        fields = ["id", "cpf", "matricula", "email", "password"]

class AlunoSerializer(serializers.ModelSerializer):
     
    id = serializers.IntegerField(read_only=True)
    user = UserSerializer()

    class Meta:
        model = Aluno
        fields = ["id", "nome", "data_nascimento", "curso", "user"]

    def create(self, validated_data):
        user_data = validated_data.pop("user")
        password = user_data.pop("password")
        user = CustomUser.objects.create(**user_data)
        user.set_password(password)
        user.save()
        aluno =  Aluno.objects.create(user = user, **validated_data)
        return aluno


class AlunoListSerializer(serializers.ModelSerializer):
     
    id = serializers.IntegerField(read_only=True)
    curso = CursoSerializer()
    user = UserSelializerRead()

    class Meta:
        model = Aluno
        fields = ["id", "nome", "data_nascimento", "curso", "user"]
