package com.shurima.pages.transacao

import geb.Module
import geb.Page

class TransacaoListPage extends Page {

    static url = "transacao"

    static at = { $('h2').text() == 'Transacao List' }

    static content = {
		dataFilter {$("input[ng-model='ctrl.filter.data']")}
		valorFilter {$("input[ng-model='ctrl.filter.valor']")}
		empresaFilter {$("select[ng-model='ctrl.filter.empresaId']")}
		tipoFilter {$("input[ng-model='ctrl.filter.tipo']")}
	
		dataSort { $("table#list th[property='data']") }
		valorSort { $("table#list th[property='valor']") }
		empresaSort { $("table#list th[property='empresa']") }
		tipoSort { $("table#list th[property='tipo']") }
    
	    createButton { $("button[crud-button='create']") }
        successMessage { $(".alert-success") }
		
        rows { moduleList TransacaoListRow, $("table#list tbody tr") }
    }

}

class TransacaoListRow extends Module {

	static content = {
		cell { $("td") }
        editButton {$("button[crud-button='edit']")}
        deleteButton {$("button[crud-button='delete']")}
    }

}