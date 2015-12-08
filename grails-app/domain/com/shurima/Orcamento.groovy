package com.shurima

class Orcamento {

    Empresa cliente
    Date dataInicio
    Date dataFinal
    Date dataMontagem
    Date dataDesmontagem
    String status
    String tipoPagamento
    Date dataPagamento
    Double valorPagamento

    static hasMany = [items: OrcamentoItem, pagamentos: OrcamentoPagamento]

    static constraints = {
        cliente nullable: true
        dataInicio nullable: true
        dataFinal nullable: true
        dataMontagem nullable: true
        dataDesmontagem nullable: true
        status nullable: true
    }

}
