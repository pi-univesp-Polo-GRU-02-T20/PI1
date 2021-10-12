from django.db import models

class Usuario(models.Model):
    nome = models.CharField(max_length = 50)
    email = models.EmailField()
    senha = models.CharField(max_length = 64)

    def __str__(self) -> str:
        return self.nome
    
class Bairro(models.Model):
    cod_bairro = models.AutoField(db_column='COD_BAIRRO', primary_key=True)  # Field name made lowercase.
    nme_bairro = models.CharField(db_column='NME_BAIRRO', max_length=100)  # Field name made lowercase.
    cod_municipio = models.ForeignKey('Municipio', models.DO_NOTHING, db_column='COD_MUNICIPIO', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'bairro'


class Categoria(models.Model):
    cod_categoria = models.AutoField(db_column='COD_CATEGORIA', primary_key=True)  # Field name made lowercase.
    nme_categoria = models.CharField(db_column='NME_CATEGORIA', max_length=100)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'categoria'


class Cliente(models.Model):
    cod_cliente = models.AutoField(db_column='COD_CLIENTE', primary_key=True)  # Field name made lowercase.
    cod_pessoa = models.ForeignKey('Pessoa', models.DO_NOTHING, db_column='COD_PESSOA')  # Field name made lowercase.
    tpo_sexo = models.CharField(db_column='TPO_SEXO', max_length=1, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'cliente'
        unique_together = (('cod_cliente', 'cod_pessoa'),)


class Endereco(models.Model):
    cod_endereco = models.IntegerField(db_column='COD_ENDERECO', primary_key=True)  # Field name made lowercase.
    dsc_complemento = models.CharField(db_column='DSC_COMPLEMENTO', max_length=255, blank=True, null=True)  # Field name made lowercase.
    nro_endereco = models.IntegerField(db_column='NRO_ENDERECO', blank=True, null=True)  # Field name made lowercase.
    dsc_ponto_referencia = models.CharField(db_column='DSC_PONTO_REFERENCIA', max_length=255, blank=True, null=True)  # Field name made lowercase.
    cod_cep = models.ForeignKey('Logradouro', models.DO_NOTHING, db_column='COD_CEP', blank=True, null=True)  # Field name made lowercase.
    cod_pessoa = models.ForeignKey('Pessoa', models.DO_NOTHING, db_column='COD_PESSOA', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'endereco'


class Estado(models.Model):
    cod_estado = models.AutoField(db_column='COD_ESTADO', primary_key=True)  # Field name made lowercase.
    nme_estado = models.CharField(db_column='NME_ESTADO', max_length=100)  # Field name made lowercase.
    sgl_uf = models.CharField(db_column='SGL_UF', max_length=2)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'estado'


class Fornecedor(models.Model):
    cod_fornecedor = models.AutoField(db_column='COD_FORNECEDOR', primary_key=True)  # Field name made lowercase.
    cod_pessoa = models.ForeignKey('Pessoa', models.DO_NOTHING, db_column='COD_PESSOA')  # Field name made lowercase.
    nme_razao_social = models.CharField(db_column='NME_RAZAO_SOCIAL', max_length=95, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'fornecedor'
        unique_together = (('cod_fornecedor', 'cod_pessoa'),)


class ItemOperacao(models.Model):
    cod_item_operacao = models.AutoField(db_column='COD_ITEM_OPERACAO', primary_key=True)  # Field name made lowercase.
    qtd_item = models.FloatField(db_column='QTD_ITEM', blank=True, null=True)  # Field name made lowercase.
    vlr_item = models.DecimalField(db_column='VLR_ITEM', max_digits=10, decimal_places=2, blank=True, null=True)  # Field name made lowercase.
    cod_operacao = models.ForeignKey('Operacao', models.DO_NOTHING, db_column='COD_OPERACAO')  # Field name made lowercase.
    cod_produto = models.ForeignKey('Produto', models.DO_NOTHING, db_column='COD_PRODUTO')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'item_operacao'


class Logradouro(models.Model):
    cod_cep = models.AutoField(db_column='COD_CEP', primary_key=True)  # Field name made lowercase.
    cod_bairro = models.ForeignKey(Bairro, models.DO_NOTHING, db_column='COD_BAIRRO')  # Field name made lowercase.
    dsc_logradouro = models.CharField(db_column='DSC_LOGRADOURO', max_length=255, blank=True, null=True)  # Field name made lowercase.
    dsc_complemento = models.CharField(db_column='DSC_COMPLEMENTO', max_length=255, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'logradouro'
        unique_together = (('cod_cep', 'cod_bairro'),)


class Municipio(models.Model):
    cod_municipio = models.AutoField(db_column='COD_MUNICIPIO', primary_key=True)  # Field name made lowercase.
    nme_municipio = models.CharField(db_column='NME_MUNICIPIO', max_length=100)  # Field name made lowercase.
    cod_estado = models.ForeignKey(Estado, models.DO_NOTHING, db_column='COD_ESTADO')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'municipio'


class Operacao(models.Model):
    cod_operacao = models.AutoField(db_column='COD_OPERACAO', primary_key=True)  # Field name made lowercase.
    dta_operacao = models.DateTimeField(db_column='DTA_OPERACAO', blank=True, null=True)  # Field name made lowercase.
    cod_nota_fiscal = models.IntegerField(db_column='COD_NOTA_FISCAL', blank=True, null=True)  # Field name made lowercase.
    vrl_total = models.DecimalField(db_column='VRL_TOTAL', max_digits=10, decimal_places=2, blank=True, null=True)  # Field name made lowercase.
    qtd_parcela = models.IntegerField(db_column='QTD_PARCELA', blank=True, null=True)  # Field name made lowercase.
    tpo_status = models.CharField(db_column='TPO_STATUS', max_length=1, blank=True, null=True)  # Field name made lowercase.
    cod_pessoa = models.ForeignKey('Pessoa', models.DO_NOTHING, db_column='COD_PESSOA', blank=True, null=True)  # Field name made lowercase.
    flg_pago = models.IntegerField(db_column='FLG_PAGO', blank=True, null=True)  # Field name made lowercase.
    tpo_operacao = models.CharField(db_column='TPO_OPERACAO', max_length=1, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'operacao'


class PagamentoOperacao(models.Model):
    cod_pagamento = models.AutoField(db_column='COD_PAGAMENTO', primary_key=True)  # Field name made lowercase.
    vlr_pagamento = models.DecimalField(db_column='VLR_PAGAMENTO', max_digits=10, decimal_places=2, blank=True, null=True)  # Field name made lowercase.
    dta_pagamento = models.DateField(db_column='DTA_PAGAMENTO', blank=True, null=True)  # Field name made lowercase.
    dta_vencimento = models.DateField(db_column='DTA_VENCIMENTO', blank=True, null=True)  # Field name made lowercase.
    cod_operacao = models.ForeignKey(Operacao, models.DO_NOTHING, db_column='COD_OPERACAO')  # Field name made lowercase.
    cod_tipo_pagamento = models.ForeignKey('TipoPagamento', models.DO_NOTHING, db_column='COD_TIPO_PAGAMENTO', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'pagamento_operacao'


class Pessoa(models.Model):
    cod_pessoa = models.AutoField(db_column='COD_PESSOA', primary_key=True)  # Field name made lowercase.
    nme_pessoa = models.CharField(db_column='NME_PESSOA', max_length=100, blank=True, null=True)  # Field name made lowercase.
    cod_cpf_cnpj = models.CharField(db_column='COD_CPF_CNPJ', max_length=20, blank=True, null=True)  # Field name made lowercase.
    num_telefone = models.CharField(db_column='NUM_TELEFONE', max_length=45, blank=True, null=True)  # Field name made lowercase.
    dsc_email = models.CharField(db_column='DSC_EMAIL', max_length=100, blank=True, null=True)  # Field name made lowercase.
    tpo_pessoa = models.CharField(db_column='TPO_PESSOA', max_length=1, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'pessoa'


class Produto(models.Model):
    cod_produto = models.AutoField(db_column='COD_PRODUTO', primary_key=True)  # Field name made lowercase.
    nme_produto = models.CharField(db_column='NME_PRODUTO', max_length=95, blank=True, null=True)  # Field name made lowercase.
    dsc_produto = models.CharField(db_column='DSC_PRODUTO', max_length=255, blank=True, null=True)  # Field name made lowercase.
    cod_subcategoria = models.ForeignKey('Subcategoria', models.DO_NOTHING, db_column='COD_SUBCATEGORIA', blank=True, null=True)  # Field name made lowercase.
    cod_unidade_medida = models.ForeignKey('UnidadeMedida', models.DO_NOTHING, db_column='COD_UNIDADE_MEDIDA', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'produto'


class Subcategoria(models.Model):
    cod_subcategoria = models.AutoField(db_column='COD_SUBCATEGORIA', primary_key=True)  # Field name made lowercase.
    nme_subcategoria = models.CharField(db_column='NME_SUBCATEGORIA', max_length=95, blank=True, null=True)  # Field name made lowercase.
    cod_categoria = models.ForeignKey(Categoria, models.DO_NOTHING, db_column='COD_CATEGORIA', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'subcategoria'


class TipoPagamento(models.Model):
    cod_tipo_pagamento = models.AutoField(db_column='COD_TIPO_PAGAMENTO', primary_key=True)  # Field name made lowercase.
    dsc_tipo_pagamento = models.CharField(db_column='DSC_TIPO_PAGAMENTO', max_length=90, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'tipo_pagamento'


class UnidadeMedida(models.Model):
    cod_unidade_medida = models.AutoField(db_column='COD_UNIDADE_MEDIDA', primary_key=True)  # Field name made lowercase.
    nme_unidade_medida = models.CharField(db_column='NME_UNIDADE_MEDIDA', max_length=100, blank=True, null=True)  # Field name made lowercase.
    sgl_unidade_medida = models.CharField(db_column='SGL_UNIDADE_MEDIDA', max_length=50, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'unidade_medida'


class Usuario(models.Model):
    cod_usuario = models.AutoField(db_column='COD_USUARIO', primary_key=True)  # Field name made lowercase.
    dsc_login = models.CharField(db_column='DSC_LOGIN', max_length=30)  # Field name made lowercase.
    dsc_senha = models.CharField(db_column='DSC_SENHA', max_length=255, blank=True, null=True)  # Field name made lowercase.
    tpo_usuario = models.CharField(db_column='TPO_USUARIO', max_length=1, blank=True, null=True)  # Field name made lowercase.
    flg_ativo = models.IntegerField(db_column='FLG_ATIVO', blank=True, null=True)  # Field name made lowercase.
    cod_pessoa = models.ForeignKey(Pessoa, models.DO_NOTHING, db_column='COD_PESSOA', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'usuario'
