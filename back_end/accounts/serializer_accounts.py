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

        return attrs

    def validate_old_password(self, value):
        user = self.context['request'].user
        if not user.check_password(value):
            raise serializers.ValidationError({"old_password": "A senha antiga não está correta."})
        return value

    def update(self, instance, validated_data):

        instance.set_password(validated_data['password'])
        instance.save()

        return instance


class PasswordResetSerializer(serializers.Serializer):
    email = serializers.EmailField()
