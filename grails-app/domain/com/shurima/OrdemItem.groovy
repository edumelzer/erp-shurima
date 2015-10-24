package com.shurima

class OrdemItem {

  Ordem ordem
  Item item
  Grupo grupo
  Long quantidadeItens
  Double valorItem

  static constraints = {
    grupo nullable: true
    item nullable: true
  }


}
