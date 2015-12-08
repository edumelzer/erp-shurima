package com.shurima

class OrcamentoController {

    def index() {
        List orcamentos = Orcamento.list()
        [ orcamentos: orcamentos, messages: params.messages]
    }

    def show(Long id) {
        return [
            ordem: Orcamento.get(id)
        ]
    }

    def create() {
        List empresasList = Empresa.createCriteria().list {
            'eq' 'isCliente', true
        }

        [empresasList: empresasList]
    }

    def remover() {
        Orcamento orcamento = Orcamento.get(params.long('id'))

        OrcamentoItem.findAllByOrcamento(orcamento).each {
            it.delete()
        }

        OrcamentoPagamento.findAllByOrcamento(orcamento).each {
            it.delete()
        }

        params.success = orcamento.delete(flush:true)
        params.errors = orcamento.errors

        redirect(action:"index")
    }

    def save() {
        def json = request.JSON
        Map resp = [
            success: false,
            message:''
        ]

        Orcamento orcamento = new Orcamento()
        bindData(orcamento, json)

        orcamento.cliente = Empresa.get(json.empresa)

        int qtdItensAdicionados = 0

        if (!ordem.cliente) {
            resp.message += "<br/>O campo cliente é obrigatório."
        }

        if (!ordem.dataSaida) {
            resp.message += "<br/>O campo Data Saída é obrigatório."
        }

        if (!ordem.dataRetorno) {
            resp.message += "<br/>O campo Data Retorno é obrigatório."
        }

        if (ordem.dataRetorno < ordem.dataSaida) {
            resp.message += "<br/>O campo Data Retorno deve ser maior que data Saída."
        }

        if (!ordem.quantidadeDias) {
            resp.message += "<br/>O campo Quantidade Dias é obrigatório."
        }

        if (!ordem.total) {
            resp.message += "<br/>O campo Total é obrigatório."
        }

        println json.produtos
        println json.grupos

        boolean possuiProdutos
        boolean possuiGrupos

        try {
            Long idProduto = json.produtos[0].id as Long
            possuiProdutos = json.produtos.size() && idProduto
        } catch (Exception e) {}

        try {
            Long idGrupo = json.grupos[0].id as Long
            possuiGrupos = json.grupos.size() && idGrupo
        } catch (Exception e) {}

        if (!(possuiProdutos || possuiGrupos)) {
            resp.message += "<br/>Deve existir pelo menos 1 produto ou grupo associado!"
        }

        resp.message = resp.message ? "<b>Erros:</b>" + resp.message : resp.message

        if (resp.message) {
            return render(contentType: 'text/json') {
                resp
            }
        }


        if (ordem.save(flush: true)) {

            println "Possui produtos?"
            println possuiProdutos

            if (possuiProdutos) {
                json.produtos.each { def produto ->
                    if (saveItem(ordem, produto)) {
                        qtdItensAdicionados++
                    }
                }
            }

            if (possuiGrupos) {
                json.grupos.each { def grupo ->
                    if (saveGrupo(ordem, grupo)) {
                        qtdItensAdicionados++
                    }
                }
            }

            resp = [
                success: true,
                message: "Registro salvo com successo com $qtdItensAdicionados itens!"
            ]

        } else {
            resp.message = "<b>Erros Desconhecidos:</b> ${ordem.errors}"
        }

        println ordem.errors

        render(contentType: 'text/json') {resp}
    }

}
