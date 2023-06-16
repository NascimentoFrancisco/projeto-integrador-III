from rest_framework import serializers

from accounts.serializer_accounts import UserSerializer
from accounts.models import CustomUser
from .models import Guarda


class GuardaCreateSerializer(serializers.ModelSerializer):
     
    id = serializers.IntegerField(read_only=True)
    user = UserSerializer()

    class Meta:
        model = Guarda
        fields = ["id", "nome", "data_nascimento", "user"]

    def create(self, validated_data):
        
        user_data = validated_data.pop("user")
        password = user_data.pop("password")
        user: CustomUser = CustomUser.objects.create(**user_data)
        user.set_password(password)
        user.save()
        aluno =  Guarda.objects.create(user = user, **validated_data)
        
        return aluno


class GuardaSerializer(serializers.ModelSerializer):

    id = serializers.IntegerField(read_only=True)
    user = UserSerializer()

    class Meta:
        model = Guarda
        fields = ["id", "nome", "data_nascimento", "user"]




