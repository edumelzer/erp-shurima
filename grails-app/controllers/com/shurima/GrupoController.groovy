package com.shurima

class GrupoController {

  def index() {
    println "CHOLA MAIS"
    List grupos = Grupo.list()
    List transacoes = Transacao.list()
    [grupos:grupos, transacoes: transacoes]
  }

}
