package com.shurima.pages.cliente

import geb.Module
import geb.Page

class ClienteListPage extends Page {

    static url = "cliente"

    static at = { $('h2').text() == 'Cliente List' }

    static content = {
		nomeFilter {$("input[ng-model='ctrl.filter.nome']")}
		cnpjFilter {$("input[ng-model='ctrl.filter.cnpj']")}
		inscricaoEstadualFilter {$("input[ng-model='ctrl.filter.inscricaoEstadual']")}
		enderecoFilter {$("input[ng-model='ctrl.filter.endereco']")}
		numeroFilter {$("input[ng-model='ctrl.filter.numero']")}
		complementoFilter {$("input[ng-model='ctrl.filter.complemento']")}
		cidadeFilter {$("input[ng-model='ctrl.filter.cidade']")}
		bairroFilter {$("input[ng-model='ctrl.filter.bairro']")}
		UFFilter {$("input[ng-model='ctrl.filter.UF']")}
		CEPFilter {$("input[ng-model='ctrl.filter.CEP']")}
		telefone1Filter {$("input[ng-model='ctrl.filter.telefone1']")}
		telefone2Filter {$("input[ng-model='ctrl.filter.telefone2']")}
		emailFilter {$("input[ng-model='ctrl.filter.email']")}
	
		nomeSort { $("table#list th[property='nome']") }
		cnpjSort { $("table#list th[property='cnpj']") }
		inscricaoEstadualSort { $("table#list th[property='inscricaoEstadual']") }
		enderecoSort { $("table#list th[property='endereco']") }
    
	    createButton { $("button[crud-button='create']") }
        successMessage { $(".alert-success") }
		
        rows { moduleList ClienteListRow, $("table#list tbody tr") }
    }

}

class ClienteListRow extends Module {

	static content = {
		cell { $("td") }
        editButton {$("button[crud-button='edit']")}
        deleteButton {$("button[crud-button='delete']")}
    }

}