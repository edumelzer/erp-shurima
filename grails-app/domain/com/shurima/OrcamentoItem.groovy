package com.shurima

class OrcamentoItem {

    Orcamento orcamento
    String descricao
    Long quantidade
    Double valor

    static constraints = {
        orcamento nullable: true
        descricao nullable: true
        quantidade nullable: true
        valor nullable: true
    }

}
