# Generated by Django 3.2.7 on 2021-10-05 12:14

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('cliente', '0002_cliente_dsc_email'),
    ]

    operations = [
        migrations.AddField(
            model_name='cliente',
            name='num_telefone',
            field=models.CharField(default=12345, max_length=20),
            preserve_default=False,
        ),
    ]