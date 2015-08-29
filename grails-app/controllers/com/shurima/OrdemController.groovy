package com.shurima

class OrdemController {
    def index() {
    }

    def create() {
      println "mimis";
      println "loles";

      List empresas = Empresa.createCriteria().list {
        'eq' 'isCliente', true
      }
      [empresas: empresas]
    }
}
