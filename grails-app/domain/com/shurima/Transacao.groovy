package com.shurima

class Transacao {

  Date data
  Double valor
  Empresa empresa
  String tipo
  Long numeroTitulo
  String observacao

  static constraints = {
    empresa nullable: true
    numeroTitulo nullable: true
  }

}
