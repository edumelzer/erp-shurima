package com.shurima.pages.transacao

import geb.Module
import geb.Page

class TransacaoCreatePage extends Page {

    static url = "transacao#/create"

    static at = { $('h2').text() == 'Criar Transacao' }

    static content = {
		dataField {$("input[ng-model='ctrl.transacao.data']")}
		valorField {$("input[ng-model='ctrl.transacao.valor']")}
		empresaField {$("select[ng-model='ctrl.transacao.empresa']")}
		tipoField {$("input[ng-model='ctrl.transacao.tipo']")}
        saveButton { $('button[crud-button="save"]') }
    }

}
