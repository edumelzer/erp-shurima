package com.shurima.pages.tipoUsuario

import geb.Module
import geb.Page

class TipoUsuarioEditPage extends Page {

    static url = "tipoUsuario#/create"

    static at = { $('h2').text() == 'Editar TipoUsuario' }

    static content = {
		descricaoField {$("input[ng-model='ctrl.tipoUsuario.descricao']")}
        saveButton { $('button[crud-button="save"]') }
    }

}
