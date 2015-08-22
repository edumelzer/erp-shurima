package com.shurima

class GrupoController {

  def index() {
    println "CHOLA MAIS"
    List grupos = Grupo.list()
    List transacoes = Transacao.list()
    [grupos:grupos, transacoes: transacoes]
  }

  def create() {
    println "mimis";
    println "loles";
  }

  def save() {
    println "SAVING WOW"
    println params

    Grupo grupo = new Grupo()
    bindData(grupo, params)
    grupo.save(flush: true)

    //render(view:"index")
    redirect(action: 'index')
  }

  def getItems(Long id) {
    println "Recuperando itens associados ao Grupo"

    List items = Item.createCriteria().list {

    }

    render(contentType: "text/json") {
      [success: true, items: items]
    }

  }

}
