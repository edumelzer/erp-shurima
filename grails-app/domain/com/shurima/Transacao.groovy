package com.shurima

class Transacao {

  Date data
  Double valor
  Empresa empresa
  String tipo

  static constraints = {
    empresa nullable: true
  }

}
