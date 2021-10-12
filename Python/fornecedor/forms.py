from django.forms import ModelForm
from fornecedor.models import fornecedor

class fornecedorForm(ModelForm): 
    class Meta: 
        model = fornecedor
        fields = ['cod_cliente','nme_cliente','dsc_email','num_telefone',
                  'dsc_logradouro','dsc_complemento','cod_cep','nme_bairro',
                  'nme_municipio','nme_estado']       
                                  
                  