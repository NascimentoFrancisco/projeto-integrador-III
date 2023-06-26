"""
URL configuration for core project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from rest_framework import routers
from accounts.views import (
    AlunoCreateView, AlunoListView, AlunoGetView, AlunoGetViewLog,
    ChangePasswordView, PasswordResetView, GetHistoricoAlunos, 
    GetAulonsPeloIdResponsavel
)
from responsavel.views import (
    ResponsavelCreateView, ResponsavelGetViewLog, ResponsavelListView
)
from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView,    
)

from guarda.views import (
    GetGuardaLogView, GuardaCreateView
)

from aluno.views import CreateHistoricoAluno

router = routers.DefaultRouter()

router.register(r'alunos', AlunoGetView)

urlpatterns = [
    path('api/token/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('api/token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    path('change_password/<int:pk>/', ChangePasswordView.as_view(), name='auth_change_password'),
    path('reset-password/', PasswordResetView.as_view()),
    path('admin/', admin.site.urls),
    path("", include(router.urls)),
    path("create/", AlunoCreateView.as_view(), name="create_aluno"),
    path('aluno-responsavel/<int:id>/', GetAulonsPeloIdResponsavel.as_view(), name='get_aluno_id_responsavel'),
    path("alunos-list/", AlunoListView.as_view(), name="list_aluno"),
    path("aluno-list/", AlunoGetViewLog.as_view(), name="list_aluno_log"),
    path('responsavel/', ResponsavelCreateView.as_view(), name="responsavel_create"),
    path("responsavel-list/", ResponsavelGetViewLog.as_view(), name="list_responsavel_log"),
    path("responsavel-lists/", ResponsavelListView.as_view(), name="list_responsavel"),

    path('historico/', GetHistoricoAlunos.as_view(), name='historico'),

    path('guarda-create/', GuardaCreateView.as_view(), name='guarda_create'),
    path('guarda-get/', GetGuardaLogView.as_view(), name='guarda_get'),

    path('create/historico/', CreateHistoricoAluno.as_view(), name='create_historico'),
]
