package com.shurima.pages.tipoUsuario

import geb.Module
import geb.Page

class TipoUsuarioListPage extends Page {

    static url = "tipoUsuario"

    static at = { $('h2').text() == 'TipoUsuario List' }

    static content = {
		descricaoFilter {$("input[ng-model='ctrl.filter.descricao']")}
	
		descricaoSort { $("table#list th[property='descricao']") }
    
	    createButton { $("button[crud-button='create']") }
        successMessage { $(".alert-success") }
		
        rows { moduleList TipoUsuarioListRow, $("table#list tbody tr") }
    }

}

class TipoUsuarioListRow extends Module {

	static content = {
		cell { $("td") }
        editButton {$("button[crud-button='edit']")}
        deleteButton {$("button[crud-button='delete']")}
    }

}