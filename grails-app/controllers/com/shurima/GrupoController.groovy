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

        Grupo grupo = new Grupo()
        bindData(grupo, json)

        int qtdItensAdicionados = 0

        if (grupo.save(flush: true)) {
            json.produtos.each {
                if (!it.removed) {
                    if (saveItem(grupo, it)) {
                        qtdItensAdicionados++
                    }
                }
            }
        }

        Map resp = [
            success: true,
            message: "Registro salvo com successo com $qtdItensAdicionados itens!"
        ]

        render(contentType: 'text/json') {resp}
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
