package com.shurima.pages.usuario

import geb.Module
import geb.Page

class UsuarioListPage extends Page {

    static url = "usuario"

    static at = { $('h2').text() == 'Usuario List' }

    static content = {
		loginFilter {$("input[ng-model='ctrl.filter.login']")}
		passwordFilter {$("input[ng-model='ctrl.filter.password']")}
		nomeFilter {$("input[ng-model='ctrl.filter.nome']")}
		tipoFilter {$("input[ng-model='ctrl.filter.tipo']")}
	
		loginSort { $("table#list th[property='login']") }
		passwordSort { $("table#list th[property='password']") }
		nomeSort { $("table#list th[property='nome']") }
		tipoSort { $("table#list th[property='tipo']") }
    
	    createButton { $("button[crud-button='create']") }
        successMessage { $(".alert-success") }
		
        rows { moduleList UsuarioListRow, $("table#list tbody tr") }
    }

}

class UsuarioListRow extends Module {

	static content = {
		cell { $("td") }
        editButton {$("button[crud-button='edit']")}
        deleteButton {$("button[crud-button='delete']")}
    }

}