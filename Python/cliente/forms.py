from django.forms import ModelForm
from cliente.models import cliente

class clienteForm(ModelForm): 
    class Meta: 
        model = cliente
        fields = ['cod_cliente','nme_cliente','dsc_email','num_telefone',
                  'dsc_logradouro','dsc_complemento','cod_cep','nme_bairro',
                  'nme_municipio','nme_estado']       
                                  
                  