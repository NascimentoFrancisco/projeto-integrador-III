# Generated by Django 4.2 on 2023-04-17 23:19

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('curso', '0003_alter_curso_sigla'),
    ]

    operations = [
        migrations.AlterField(
            model_name='curso',
            name='sigla',
            field=models.CharField(max_length=5, verbose_name='Sigla'),
        ),
        migrations.AlterField(
            model_name='curso',
            name='turno',
            field=models.CharField(max_length=20, verbose_name='Turno'),
        ),
    ]
