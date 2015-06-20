package com.shurima.pages.tipoUsuario

import geb.Page

class TipoUsuarioShowPage extends Page {

    static at = { $('h2').text().startsWith 'Show TipoUsuario' }

    static content = {
        successMessage { $(".alert-success") }
    }

}