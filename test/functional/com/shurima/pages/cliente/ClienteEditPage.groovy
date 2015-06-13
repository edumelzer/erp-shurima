package com.shurima.pages.cliente

import geb.Module
import geb.Page

class ClienteEditPage extends Page {

    static url = "cliente#/create"

    static at = { $('h2').text() == 'Edit Cliente' }

    static content = {
		nomeField {$("input[ng-model='ctrl.cliente.nome']")}
		cnpjField {$("input[ng-model='ctrl.cliente.cnpj']")}
		inscricaoEstadualField {$("input[ng-model='ctrl.cliente.inscricaoEstadual']")}
		enderecoField {$("input[ng-model='ctrl.cliente.endereco']")}
		numeroField {$("input[ng-model='ctrl.cliente.numero']")}
		complementoField {$("input[ng-model='ctrl.cliente.complemento']")}
		cidadeField {$("input[ng-model='ctrl.cliente.cidade']")}
		bairroField {$("input[ng-model='ctrl.cliente.bairro']")}
		UFField {$("input[ng-model='ctrl.cliente.UF']")}
		CEPField {$("input[ng-model='ctrl.cliente.CEP']")}
		telefone1Field {$("input[ng-model='ctrl.cliente.telefone1']")}
		telefone2Field {$("input[ng-model='ctrl.cliente.telefone2']")}
		emailField {$("input[ng-model='ctrl.cliente.email']")}
        saveButton { $('button[crud-button="save"]') }
    }

}