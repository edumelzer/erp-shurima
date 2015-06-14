package com.shurima.pages.empresa

import geb.Page

class EmpresaShowPage extends Page {

    static at = { $('h2').text().startsWith 'Show Empresa' }

    static content = {
        successMessage { $(".alert-success") }
    }

}