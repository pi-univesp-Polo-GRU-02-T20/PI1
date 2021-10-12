from django.db import models

# Create your models here.

class cliente(models.Model): 
    cod_cliente = models.IntegerField(11)
    nme_cliente = models.CharField(max_length=100)
    dsc_email = models.EmailField()
    num_telefone = models.CharField(max_length=20)
    dsc_logradouro = models.CharField(max_length=255)
    dsc_complemento = models.CharField(max_length=255)
    cod_cep = models.IntegerField(11)
    nme_bairro = models.CharField(max_length=255)
    nme_municipio = models.CharField(max_length=100)
    nme_estado = models.CharField(max_length=100)
    
  
