package com.shurima

class OrdemController {
    def index() {
    }

    def create() {
      println "mimis";
      println "loles";

      List gruposList = Grupo.list()
      List produtosList = Item.list()

      List empresasList = Empresa.createCriteria().list {
        'eq' 'isCliente', true
      }

      [empresasList: empresasList, gruposList: gruposList, produtosList: produtosList]
    }
}
