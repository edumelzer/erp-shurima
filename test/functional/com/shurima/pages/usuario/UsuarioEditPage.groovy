package com.shurima.pages.usuario

import geb.Module
import geb.Page

class UsuarioEditPage extends Page {

    static url = "usuario#/create"

    static at = { $('h2').text() == 'Editar Usuario' }

    static content = {
		loginField {$("input[ng-model='ctrl.usuario.login']")}
		passwordField {$("input[ng-model='ctrl.usuario.password']")}
		nomeField {$("input[ng-model='ctrl.usuario.nome']")}
        saveButton { $('button[crud-button="save"]') }
    }

}
