package com.shurima

class OrdemController {

    def index() {
        List ordens = Ordem.list()
        [ordens:ordens]
    }

    def show(Long id) {
        return [
            ordem: Ordem.get(id)
        ]
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

        ordem.cliente = Empresa.get(json.empresa)

        int qtdItensAdicionados = 0

        println "Buscando Empresa"
        println json.empresa
        println Empresa.get(json.empresa)

        println "--------------------"
        println json
        println "--------------------"
        println json.produtos

        if (ordem.save(flush: true)) {

            json.produtos.each { def produto ->
                if (saveItem(ordem, produto)) {
                    qtdItensAdicionados++
                }
            }

            json.grupos.each { def grupo ->
                if (saveGrupo(ordem, grupo)) {
                    qtdItensAdicionados++
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
        OrdemItem ordemItem = OrdemItem.findByOrdemAndItem(ordem, item)

        println "Tentando salvar ITEM!"
        println item
        println ordemItem

        if (!ordemItem) {
            ordemItem = new OrdemItem(
                ordem: ordem,
                item: item,
                quantidadeItens: pars.qtd,
                valorItem: pars.valor)
        } else {
            ordemItem.setQuantidade(pars.qtd)
        }

        try {
            boolean saved = ordemItem.save(flush:true)

            println "FOI MAL NEM DEU"
            println ordemItem.errors

            return saved
        } catch (Exception e) {
            println "Erro ao salvar item:"
            println ordemItem.errors
            return false
        }
    }

    private boolean saveGrupo(Ordem ordem, Map pars) {

        Grupo grupo = Grupo.get(pars.id)
        OrdemItem ordemItem = OrdemItem.findByOrdemAndGrupo(ordem, grupo)

        if (!ordemItem) {
            ordemItem = new OrdemItem(
                ordem: ordem,
                grupo: grupo,
                quantidadeItens: pars.qtd,
                valorItem: pars.valor)
        } else {
            ordemItem.setQuantidade(pars.qtd)
        }

        try {
            boolean saved = ordemItem.save(flush:true)

            println "FOI MAL NEM DEU"
            println ordemItem.errors

            return saved
        } catch (Exception e) {
            println "Erro ao salvar Grupo:"
            println ordemItem.errors
            return false
        }
    }


}
