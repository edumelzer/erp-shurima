package com.shurima.pages.empresa

import geb.Module
import geb.Page

class EmpresaEditPage extends Page {

    static url = "empresa#/create"

    static at = { $('h2').text() == 'Editar Empresa' }

    static content = {
		nomeField {$("input[ng-model='ctrl.empresa.nome']")}
		cnpjField {$("input[ng-model='ctrl.empresa.cnpj']")}
		inscricaoEstadualField {$("input[ng-model='ctrl.empresa.inscricaoEstadual']")}
		enderecoField {$("input[ng-model='ctrl.empresa.endereco']")}
		numeroField {$("input[ng-model='ctrl.empresa.numero']")}
		complementoField {$("input[ng-model='ctrl.empresa.complemento']")}
		cidadeField {$("input[ng-model='ctrl.empresa.cidade']")}
		bairroField {$("input[ng-model='ctrl.empresa.bairro']")}
		UFField {$("input[ng-model='ctrl.empresa.UF']")}
		CEPField {$("input[ng-model='ctrl.empresa.CEP']")}
		telefone1Field {$("input[ng-model='ctrl.empresa.telefone1']")}
		telefone2Field {$("input[ng-model='ctrl.empresa.telefone2']")}
		emailField {$("input[ng-model='ctrl.empresa.email']")}
		isClienteField {$("input[ng-model='ctrl.empresa.isCliente']")}
		isFornecedorField {$("input[ng-model='ctrl.empresa.isFornecedor']")}
        saveButton { $('button[crud-button="save"]') }
    }

}
