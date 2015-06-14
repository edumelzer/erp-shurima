package com.shurima

class Empresa {

  String nome
  Long cnpj
  String inscricaoEstadual
  String endereco
  Long numero
  String complemento
  String cidade
  String bairro
  String UF
  Long CEP
  Long telefone1
  Long telefone2
  String email
  boolean isCliente
  boolean isFornecedor

  static constraints = {
    inscricaoEstadual nullable: true
    complemento nullable: true
    telefone1 nullable: true
    telefone2 nullable: true
    email nullable: true
  }

  static mapping = {
    isCliente type: 'yes_no'
    isFornecedor type: 'yes_no'
  }

}
