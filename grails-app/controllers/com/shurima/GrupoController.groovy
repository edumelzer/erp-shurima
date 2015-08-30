package com.shurima

class GrupoController {

    def index() {
        println "CHOLA MAIS"
        println "Pq o choro é livre"
        List grupos = Grupo.list()
        List transacoes = Transacao.list()
        [grupos:grupos, transacoes: transacoes]
    }

    def create() {
        println "mimisx"
        println "loles"
        println params
        Grupo grupin = new Grupo()
        grupin.properties = params

        /*def gitem = new GrupoItem(grupo: grupin, item: Item.list()[0])

        grupin.items = [gitem]*/

        println "mimis?"
        println grupin.items

        List items = GrupoItem.createCriteria().list {
            'grupo' {
                'eq' 'id', grupin?.id
            }
        }

        List produtosList = Item.list()

        return [grupin: grupin, items: items, produtosList: produtosList]
    }

    def save() {
        println "SAVING WOW"
        println params

        Grupo grupo = new Grupo()
        bindData(grupo, params)
        grupo.save(flush: true)

        //render(view:"index")
        redirect(action: 'index')
    }

    def getItems(Long id) {
        println "Recuperando itens associados ao Grupo"

        List items = Item.createCriteria().list {

        }

        render(contentType: "text/json") {
            [success: true, items: items]
        }

    }

}
