from rest_framework import serializers
from rest_framework_simplejwt.tokens import AccessToken
from .models import Aluno, AlunoHistorico

class SerializerCreateHistorico(serializers.ModelSerializer):

    token = serializers.CharField(write_only=True)

    class Meta:
        model = AlunoHistorico
        fields = ['token', 'tipo_movimentacao']
    
    def create(self, validated_data):
        token = validated_data.pop("token")
        aluno = self.get_aluno_by_token_user(token)
        validated_data['aluno'] = aluno
    
        try:
            historico = AlunoHistorico.objects.create(**validated_data)
        except Exception as e:
            raise serializers.ValidationError(e.args[0])
        return historico

    def get_aluno_by_token_user(self, token):

        try:
            decoded_token = AccessToken(token)
            user_id = decoded_token['user_id']
            aluno = Aluno.objects.get(user__id=user_id)
            return aluno
        except Exception as e:
            raise serializers.ValidationError({"Error":"Token inválido"})
            