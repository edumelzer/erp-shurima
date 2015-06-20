package com.shurima

class Item {

  String nome
  Long quantidade
  Double valor1
  Double valor2
  Double valor3
  String unidade

  static constraints = {
    valor2 nullable: true
    valor3 nullable: true
    }


  String toString() {
    return this.nome
  }

}
