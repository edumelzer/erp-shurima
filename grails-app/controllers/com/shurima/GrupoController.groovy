package com.shurima

class GrupoController {

    def index() {
        List grupos = Grupo.list()
        //List transacoes = Transacao.list()
        //[grupos:grupos, transacoes: transacoes]
        [grupos:grupos]
    }

    def create() {
        Grupo grupin = new Grupo()
        grupin.properties = params

        List items = GrupoItem.createCriteria().list {
            'grupo' {
                'eq' 'id', grupin?.id
            }
        }

        List produtosList = Item.list()

        return [grupin: grupin, items: items, produtosList: produtosList]
    }

    def save() {
        def json = request.JSON
        Map resp = [
            message:''
        ]

        Grupo grupo = new Grupo()
        bindData(grupo, json)

        int qtdItensAdicionados = 0

        if (!grupo.descricao) {
            resp.message += "<br/>O campo descrição é obrigatório."
        }

        if (!grupo.valor1) {
            resp.message += "<br/>O campo Valor 1 é obrigatório."
        }

        if (!grupo.valor2) {
            resp.message += "<br/>O campo Valor 2 é obrigatório."
        }

        if (!grupo.valor3) {
            resp.message += "<br/>O campo Valor 3 é obrigatório."
        }

        boolean possuiProdutos

        try {
            Long idProduto = json.produtos[0].id as Long
            possuiProdutos = json.produtos.size() && idProduto
        } catch (Exception e) {}

        if ( !possuiProdutos ) {
            resp.message += "<br/>Deve existir pelo menos 1 produto."
        }

        resp.message = resp.message ? "<b>Erros:</b>" + resp.message : resp.message

        if (resp.message) {
            return render(contentType: 'text/json') {
                resp
            }
        }

        resp.success = grupo.save(flush: true);

        if (resp.success) {
            json.produtos.each {
                if (!it.removed) {
                    if (saveItem(grupo, it)) {
                        qtdItensAdicionados++
                    }
                }
            }
            resp.message = "Registro salvo com successo com $qtdItensAdicionados itens!"
        } else {
            resp.message = "<b>Erros Desconhecidos:</b> ${grupo.errors}"
        }

        render(contentType: 'text/json') {
            resp
        }
    }

    def show(Long id) {
        return [
            grupo: Grupo.get(id)
        ]
    }

    def getItems(Long id) {
        List items = Item.createCriteria().list {

        }

        render(contentType: "text/json") {
            [success: true, items: items]
        }
    }

    private boolean saveItem(Grupo grupo, Map pars) {

        Item item = Item.get(pars.id)
        GrupoItem grupoItem = GrupoItem.findByGrupoAndItem(grupo, item)

        if (!grupoItem) {
            grupoItem = new GrupoItem(grupo: grupo, item: item, quantidade: pars.qtd)
        } else {
            grupoItem.setQuantidade(pars.qtd)
        }

        try {
            return grupoItem.save(flush:true)
        } catch (Exception e) {
            return false
        }
    }

}
