package com.shurima

class OrdemController {

    def index() {
        List ordens = Ordem.list()
        [ ordens:ordens,messages: params.messages]
    }

    def show(Long id) {
        return [
            ordem: Ordem.get(id)
        ]
    }

    def create() {
      List gruposList = Grupo.list()
      List produtosList = Item.list()

      List empresasList = Empresa.createCriteria().list {
        'eq' 'isCliente', true
      }

      [empresasList: empresasList, gruposList: gruposList, produtosList: produtosList]

    }

    def remover() {
        Ordem ordem = Ordem.get(params.long('id'))

        OrdemItem.findAllByOrdem(ordem).each {
            it.delete()
        }

        params.success = ordem.delete(flush:true)
        params.errors = ordem.errors

        redirect(action:"index")
    }

    def save() {
        def json = request.JSON
        Map resp = [
            success: false,
            message:''
        ]

        Ordem ordem = new Ordem()
        bindData(ordem, json)

        ordem.cliente = Empresa.get(json.empresa)

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

    def getItems(Long id) {
        List items = Item.createCriteria().list {

        }

        render(contentType: "text/json") {
            [success: true, items: items]
        }
    }

    private boolean saveItem(Ordem ordem, Map pars) {
        Long idGrupo

        try {
            idGrupo = pars.id as Long
        } catch (Exception e) {
            println "Nao converteu ID"
            //e.printStackTrace()
            println e.getMessage()
            return false;
        }

        Item item = Item.get(pars.id as Long)
        OrdemItem ordemItem = OrdemItem.findByOrdemAndItem(ordem, item)

        println "Ordem"
        println ordemItem

        if (!ordemItem) {
            ordemItem = new OrdemItem(
                ordem: ordem,
                item: item,
                quantidadeItens: pars.qtd,
                valorItem: pars.valor)
        } else {
            ordemItem.setQuantidadeItens(pars.qtd as Long)
        }
        println ordemItem
        try {
            boolean saved = ordemItem.save(flush:true)
            println ordemItem
            println "FOI MAL NEM DEU ITEMS"
            println ordemItem.errors

            return saved
        } catch (Exception e) {
            println "Erro ao salvar Produto:"
            //e.printStackTrace()
            println e.getMessage()
            println ordemItem.errors
            return false
        }
    }

    private boolean saveGrupo(Ordem ordem, Map pars) {
        Long idGrupo
        try {
            idGrupo = pars.id as Long
        } catch (Exception e) {
            return false;
        }

        Grupo grupo = Grupo.get(pars.id as Long)
        OrdemItem ordemItem = OrdemItem.findByOrdemAndGrupo(ordem, grupo)

        if (!ordemItem) {
            ordemItem = new OrdemItem(
                ordem: ordem,
                grupo: grupo,
                quantidadeItens: pars.qtd,
                valorItem: pars.valor)
        } else {
            ordemItem.setQuantidadeItens(pars.qtd as Long)
        }

        try {
            boolean saved = ordemItem.save(flush:true)

            println "FOI MAL NEM DEU"
            println ordemItem.errors

            return saved
        } catch (Exception e) {
            println "Erro ao salvar Grupo:"
            //e.printStackTrace()
            println e.getMessage()
            println ordemItem.errors
            return false
        }
    }


}
