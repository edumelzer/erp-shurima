package com.shurima.pages.item

import geb.Module
import geb.Page

class ItemCreatePage extends Page {

    static url = "item#/create"

    static at = { $('h2').text() == 'Criar Item' }

    static content = {
		nomeField {$("input[ng-model='ctrl.item.nome']")}
		quantidadeField {$("input[ng-model='ctrl.item.quantidade']")}
		valor1Field {$("input[ng-model='ctrl.item.valor1']")}
		valor2Field {$("input[ng-model='ctrl.item.valor2']")}
		valor3Field {$("input[ng-model='ctrl.item.valor3']")}
		unidadeField {$("input[ng-model='ctrl.item.unidade']")}
        saveButton { $('button[crud-button="save"]') }
    }

}
