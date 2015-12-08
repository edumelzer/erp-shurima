package com.shurima

class OrcamentoPagamento {

    Orcamento orcamento
    Date data
    Double valor

    static constraints = {
        orcamento nullable: true
        data nullable: true
        valor nullable: true
    }

}
