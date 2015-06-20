package com.shurima.pages.usuario

import geb.Page

class UsuarioShowPage extends Page {

    static at = { $('h2').text().startsWith 'Show Usuario' }

    static content = {
        successMessage { $(".alert-success") }
    }

}