package com.shurima.pages.item

import geb.Module
import geb.Page

class ItemListPage extends Page {

    static url = "item"

    static at = { $('h2').text() == 'Item List' }

    static content = {
		nomeFilter {$("input[ng-model='ctrl.filter.nome']")}
		quantidadeFilter {$("input[ng-model='ctrl.filter.quantidade']")}
		valor1Filter {$("input[ng-model='ctrl.filter.valor1']")}
		valor2Filter {$("input[ng-model='ctrl.filter.valor2']")}
		valor3Filter {$("input[ng-model='ctrl.filter.valor3']")}
		unidadeFilter {$("input[ng-model='ctrl.filter.unidade']")}
	
		nomeSort { $("table#list th[property='nome']") }
		quantidadeSort { $("table#list th[property='quantidade']") }
		valor1Sort { $("table#list th[property='valor1']") }
		valor2Sort { $("table#list th[property='valor2']") }
    
	    createButton { $("button[crud-button='create']") }
        successMessage { $(".alert-success") }
		
        rows { moduleList ItemListRow, $("table#list tbody tr") }
    }

}

class ItemListRow extends Module {

	static content = {
		cell { $("td") }
        editButton {$("button[crud-button='edit']")}
        deleteButton {$("button[crud-button='delete']")}
    }

}