import re
from rest_framework import serializers
from curso.serializer_curso import CursoSerializer
from aluno.models import Aluno, AlunoHistorico
from .models import CustomUser


class UserSelializerRead(serializers.ModelSerializer):

    id = serializers.IntegerField(read_only=True)
    
    class Meta:
        model = CustomUser
        fields = ["id", "cpf", "email"]


class UserSerializer(serializers.ModelSerializer):
     
    id = serializers.IntegerField(read_only=True)
    password = serializers.CharField(write_only=True)
    
    class Meta:
        model = CustomUser
        fields = ["id", "cpf", "email", "password"]

class AlunoSerializer(serializers.ModelSerializer):
     
    id = serializers.IntegerField(read_only=True)
    user = UserSerializer()

    class Meta:
        model = Aluno
        fields = ["id", "nome", "data_nascimento", "curso", "responsavel", "user"]

    def create(self, validated_data):
        
        user_data = validated_data.pop("user")
        password = user_data.pop("password")
        user: CustomUser = CustomUser.objects.create(**user_data)
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


class ChangePasswordSerializer(serializers.ModelSerializer):
    password = serializers.CharField(write_only=True, required=True)
    password2 = serializers.CharField(write_only=True, required=True)
    old_password = serializers.CharField(write_only=True, required=True)

    class Meta:
        model = CustomUser
        fields = ('old_password', 'password', 'password2')

    def validate(self, attrs):
        if attrs['password'] != attrs['password2']:
            raise serializers.ValidationError({"password": "Os campos de senha não correspondem."})
        
        if len(attrs['password']) < 8 or not bool(re.search(r'^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+$', attrs['password'])):
            msg = "Nova senha inválida, crie uma senha com 8 ou mais caracteres composta por letras e números!"
            raise serializers.ValidationError({"password": msg})

        return attrs

    def validate_old_password(self, value):
        user = self.context['request'].user
        if not user.check_password(value):
            raise serializers.ValidationError({"old_password": "A senha antiga não está correta."})
        return value

    def update(self, instance: CustomUser, validated_data):

        instance.set_password(validated_data['password'])
        instance.save()

        return instance


class PasswordResetSerializer(serializers.Serializer):
    email = serializers.EmailField()


class AlunoByHistoricoSerializer(serializers.ModelSerializer):
     
    id = serializers.IntegerField(read_only=True)

    class Meta:
        model = Aluno
        fields = ["id", "nome", "data_nascimento"]

class HistoricoSerializaer(serializers.ModelSerializer):
    
    aluno = AlunoByHistoricoSerializer()

    class Meta:
        model = AlunoHistorico
        fields = ["id", "criado_em", "tipo_movimentacao", "aluno"]