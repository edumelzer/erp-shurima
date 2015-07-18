package com.shurima

class Transacao {

  Date data
  Double valor
  Empresa empresa
  String tipo
  Long numeroTitulo
  String observacao

  static constraints = {
    numeroTitulo nullable: true
    observacao nullable: true
  }

}
