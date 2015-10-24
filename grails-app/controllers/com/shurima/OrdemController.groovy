package com.shurima

class OrdemController {

    def index() {
        List ordens = Ordem.list()
        [ordens:ordens]
    }

    def create() {
      println "mimis";
      println "loles";

      List gruposList = Grupo.list()
      List produtosList = Item.list()

      List empresasList = Empresa.createCriteria().list {
        'eq' 'isCliente', true
      }

      println "Listinha"
      println empresasList
      
      [empresasList: empresasList, gruposList: gruposList, produtosList: produtosList]

    }

    def save() {
        println "SAVING WOW"
        def json = request.JSON

        Ordem ordem = new Ordem()
        bindData(ordem, json)

        int qtdItensAdicionados = 0

        println json.

        println "--------------------"
        println json
        println "--------------------"

        if (ordem.save(flush: true)) {

            json.produtos.each { def produto ->
                if (!produto.removed) {
                    if (saveItem(ordem, produto)) {
                        qtdItensAdicionados++
                    }
                }
            }
        }

        println ordem.errors

        Map resp = [
            success: true,
            message: "Registro salvo com successo com $qtdItensAdicionados itens!"
        ]

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

        Item item = Item.get(pars.id)
        OrdemItem ordemItem = OrdemItem.findByGrupoAndItem(ordem, item)

        if (!ordemItem) {
            ordemItem = new OrdemItem(ordem: ordem, item: item, quantidade: pars.qtd)
        } else {
            ordemItem.setQuantidade(pars.qtd)
        }

        try {
            return ordemItem.save(flush:true)
        } catch (Exception e) {
            return false
        }
    }



}
