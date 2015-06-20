package com.shurima

class Transacao {

  Date data
  Double valor
  Empresa empresa
  String tipo
  Long   numeroTitulo

  static constraints = {
    empresa nullable: true
  }

}
