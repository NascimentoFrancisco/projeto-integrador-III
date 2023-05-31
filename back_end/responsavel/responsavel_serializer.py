from rest_framework import serializers
from accounts.models import CustomUser

from accounts.serializer_accounts import UserSerializer, UserSelializerRead
from .models import Responsavel

class ResposanvelSerializer(serializers.ModelSerializer):
     
    id = serializers.IntegerField(read_only=True)
    user = UserSerializer()

    class Meta:
        model = Responsavel
        fields = ["id", "nome", "data_nascimento", "user"]

    def create(self, validated_data):
        
        user_data = validated_data.pop("user")
        password = user_data.pop("password")
        user = CustomUser.objects.create(**user_data)
        user.set_password(password)
        user.save()
        responsavel = Responsavel.objects.create(user = user, **validated_data)
        
        return responsavel


class ResponsavelListSerializer(serializers.ModelSerializer):
     
    id = serializers.IntegerField(read_only=True)
    user = UserSelializerRead()

    class Meta:
        model = Responsavel
        fields = ["id", "nome", "data_nascimento", "user"]