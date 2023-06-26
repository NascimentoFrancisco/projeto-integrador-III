from django.contrib import admin
from django.contrib.auth.admin import UserAdmin

# Register your models here.
from .models import CustomUser


class UserAdminConfig(UserAdmin):
    
    model = CustomUser
    list_display = ('cpf', 'email','is_superuser','is_staff', 'is_active',)
    list_filter = ('cpf', 'email', 'is_superuser','is_staff', 'is_active',)
    fieldsets = (
        (None, {'fields': ('cpf', 'email', 'password')}),
        ('Permissions', {'fields': ('is_superuser','is_staff', 'is_active')}),
    )
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('cpf', 'email', 'password1', 'password2', 'is_superuser','is_staff', 'is_active')}
        ),
    )
    search_fields = ('cpf',)
    ordering = ('cpf',)

admin.site.register(CustomUser, UserAdminConfig)