package com.shurima

class Empresa {

  String nome
  String cnpj
  String inscricaoEstadual
  String endereco
  Long numero
  String complemento
  String cidade
  String bairro
  String UF
  String CEP
  String telefone1
  String telefone2
  String email
  String email2
  String contato
  String contato2
  boolean isCliente
  boolean isFornecedor

  static constraints = {
    inscricaoEstadual nullable: true
    complemento nullable: true
    telefone1 nullable: true
    telefone2 nullable: true
    email nullable: true
    email2 nullable: true
    contato nullable: true
    contato2 nullable: true
  }

  static mapping = {
    isCliente type: 'yes_no'
    isFornecedor type: 'yes_no'
  }

  String toString() {
    return this.nome
  }

}
